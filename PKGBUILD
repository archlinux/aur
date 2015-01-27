# Maintainer: Matt Harrison <matt@mistbyte.com>
# This PKGBUILD is maintained at https://github.com/matt-h/aur-pkgbuilds/tree/master/mediaelch

pkgname=mediaelch
pkgver=2.2.1
pkgrel=1
pkgdesc="a Media Manager for handling Movies, TV Shows and Concerts/Music Videos in XBMC."
arch=('x86_64' 'i686')
url="http://www.mediaelch.de/"
license=('GPL')
depends=('libmediainfo' 'qt5-multimedia' 'qt5-script' 'quazip-qt5')
makedepends=()
source=("http://www.kvibes.de/releases/mediaelch/$pkgver/mediaelch-$pkgver.tar.gz")
sha256sums=('58a63f5242710ddbb63d41e01ca312ce709259fea776f1ca3e7da1c840ab93d2')

build() {
  cd "$srcdir/mediaelch-$pkgver/"
  qmake && make
}

package() {
  cd "$srcdir/mediaelch-$pkgver/"
  make INSTALL_ROOT="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
