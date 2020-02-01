# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=gemrb
pkgver=0.8.6
pkgrel=1
pkgdesc="OSS implementation of Bioware's Infinity Engine which supports eg. Baldur's Gate"
arch=('x86_64')
url="http://www.gemrb.org/"
license=('GPL')
depends=('python2' 'sdl2' 'sdl2_mixer' 'openal' 'hicolor-icon-theme' 'libpng' 'freetype2')
makedepends=('cmake')
install=gemrb.install
source=("https://downloads.sourceforge.net/sourceforge/gemrb/$pkgname-$pkgver.tar.gz")
sha1sums=('251885fdc831ca59bfdad92cce0f204d0070afbb')

prepare() {
  mkdir -p build
}

build() {
  cd build

  cmake ../$pkgname-$pkgver \
      -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

