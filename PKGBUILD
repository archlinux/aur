# Maintainer: Matt Harrison <matt@mistbyte.com>
# This PKGBUILD is maintained at https://github.com/matt-h/aur-pkgbuilds/tree/master/mediaelch

pkgname=mediaelch
pkgver=2.1.2
pkgrel=1
pkgdesc="a Media Manager for handling Movies, TV Shows and Concerts/Music Videos in XBMC."
arch=('x86_64' 'i686')
url="http://www.mediaelch.de/"
license=('GPL')
depends=('libmediainfo' 'qt5-multimedia' 'qt5-script' 'quazip-qt5')
makedepends=()
source=("http://www.kvibes.de/releases/mediaelch/$pkgver/mediaelch-$pkgver.tar.gz")
sha256sums=('f95db570466188de4d405a8ad350ce9e9bd0c67b38083cb21330878f25fad513')

build() {
  cd "$srcdir/mediaelch-$pkgver/"
  qmake && make
}

package() {
  cd "$srcdir/mediaelch-$pkgver/"
  make INSTALL_ROOT="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
