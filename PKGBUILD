# Maintainer: Matt Harrison <matt@mistbyte.com>
# This PKGBUILD is maintained at https://github.com/matt-h/aur-pkgbuilds/tree/master/mediaelch

pkgname=mediaelch
pkgver=1.6
pkgrel=1
pkgdesc="a Media Manager for handling Movies, TV Shows and Concerts/Music Videos in XBMC."
arch=('x86_64' 'i686')
url="http://www.mediaelch.de/"
license=('GPL')
depends=('libmediainfo' 'phonon')
makedepends=()
source=("http://www.mediaelch.de/releases/$pkgver/mediaelch-$pkgver.tar.gz")
sha256sums=('ee5624bdb11c51d95953d654af167fa8e6ecade1204f2cbf8da0ad6bb96fbf6c')

build() {
  cd "$srcdir/mediaelch-$pkgver/"
  qmake-qt4 && make
}

package() {
  cd "$srcdir/mediaelch-$pkgver/"
  make INSTALL_ROOT="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
