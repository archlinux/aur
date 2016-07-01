# Maintainer: Matt Harrison <matt@mistbyte.com>
# This PKGBUILD is maintained at https://github.com/matt-h/aur-pkgbuilds/tree/master/mediaelch

pkgname=mediaelch
pkgver=2.4.2
pkgrel=1
pkgdesc="a Media Manager for handling Movies, TV Shows and Concerts/Music Videos in XBMC."
arch=('x86_64' 'i686')
url="http://www.mediaelch.de/"
license=('GPL')
depends=('libmediainfo' 'qt5-declarative' 'qt5-multimedia' 'qt5-script')
makedepends=()
source=("http://www.kvibes.de/releases/mediaelch/$pkgver/mediaelch-$pkgver.tar.gz")
sha256sums=('c00afd8328258c280e9a8f22cae76b95a6d26824c67de6cf4db91639d4695e49')

build() {
  cd "$srcdir/mediaelch-$pkgver/"
  qmake && make
}

package() {
  cd "$srcdir/mediaelch-$pkgver/"
  make INSTALL_ROOT="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
