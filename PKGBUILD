# Maintainer: Matt Harrison <matt@mistbyte.com>
# This PKGBUILD is maintained at https://github.com/matt-h/aur-pkgbuilds/tree/master/mediaelch

pkgname=mediaelch
pkgver=1.7
pkgrel=1
pkgdesc="a Media Manager for handling Movies, TV Shows and Concerts/Music Videos in XBMC."
arch=('x86_64' 'i686')
url="http://www.mediaelch.de/"
license=('GPL')
depends=('libmediainfo' 'phonon' 'quazip')
makedepends=()
source=("http://www.mediaelch.de/releases/$pkgver/mediaelch-$pkgver.tar.gz")
sha256sums=('5e7f509996686e1bd6719d767e03b5d327dd3eefeed3ce9aeb4e0226aa515fd5')

build() {
  cd "$srcdir/mediaelch-$pkgver/"
  qmake-qt4 && make
}

package() {
  cd "$srcdir/mediaelch-$pkgver/"
  make INSTALL_ROOT="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
