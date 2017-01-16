# Maintainer: Lukas Spies <lukas (at) photoqt _dot_ org>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=photoqt
pkgver=1.5
pkgrel=2
pkgdesc="Fast and highly configurable image viewer with a simple and nice interface."
arch=('any')
url="http://photoqt.org/"
license=('GPL2')
depends=('exiv2' 'graphicsmagick' 'qt5-base' 'qt5-imageformats' 'qt5-multimedia' 'qt5-charts' 'qt5-svg' 'qt5-declarative' 'qt5-quickcontrols' 'libraw' 'qt5-graphicaleffects')
optdepends=('libqpsd-git: PSB/PSD support'
            'xcftools: XCF support')
makedepends=('cmake' 'qt5-tools')
install=$pkgname.install
source=(http://photoqt.org/pkgs/$pkgname-$pkgver.tar.gz)
md5sums=('1946384fe98a06e196dd99574fa4469a')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  # If you want to build PhotoQt with less features(without exiv2, graphicsmagick and/or libraw),
  # add either of -DEXIV2=OFF -DGM=OFF -DRAW=OFF to the next line.
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
