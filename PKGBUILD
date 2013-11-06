# Maintainer: Matt Harrison <matt@mistbyte.com>
# This PKGBUILD is maintained at https://github.com/matt-h/aur-pkgbuilds/tree/master/mediaelch

pkgname=mediaelch
pkgver=2.0.1
pkgrel=1
pkgdesc="a Media Manager for handling Movies, TV Shows and Concerts/Music Videos in XBMC."
arch=('x86_64' 'i686')
url="http://www.mediaelch.de/"
license=('GPL')
depends=('libmediainfo' 'qt5-multimedia' 'qt5-script' 'quazip-qt5')
makedepends=()
source=("http://www.mediaelch.de/releases/$pkgver/mediaelch-$pkgver.tar.gz")
sha256sums=('768a76e8754c4bc995fa12ace1b9a63dbead3d03a0ad45debff7d0ccbd520ae9')

build() {
  cd "$srcdir/mediaelch-$pkgver/"
  qmake && make
}

package() {
  cd "$srcdir/mediaelch-$pkgver/"
  make INSTALL_ROOT="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
