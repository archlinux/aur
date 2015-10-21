# Maintainer: Matt Harrison <matt@mistbyte.com>
# This PKGBUILD is maintained at https://github.com/matt-h/aur-pkgbuilds/tree/master/mediaelch

pkgname=mediaelch
pkgver=2.3.2
pkgrel=1
pkgdesc="a Media Manager for handling Movies, TV Shows and Concerts/Music Videos in XBMC."
arch=('x86_64' 'i686')
url="http://www.mediaelch.de/"
license=('GPL')
depends=('libmediainfo' 'qt5-multimedia' 'qt5-script')
makedepends=()
source=("http://www.kvibes.de/releases/mediaelch/$pkgver/mediaelch-$pkgver.tar.gz")
sha256sums=('f4606de782953aac3269fd5e3e68a8bf20134eee71769b5aedcb4ddca481bcf8')

build() {
  cd "$srcdir/mediaelch-$pkgver/"
  qmake && make
}

package() {
  cd "$srcdir/mediaelch-$pkgver/"
  make INSTALL_ROOT="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
