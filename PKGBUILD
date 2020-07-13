# Maintainer: Michael Straube <michael.straube@posteo.de>

pkgname=edges
pkgver=1.0
pkgrel=1
pkgdesc="A command-line tool to set up X11 hot-corners"
arch=(x86_64)
url="https://github.com/arisinfenix/edges"
license=(GPL3)
depends=(libx11 libxi libxrandr libconfig)
makedepends=(libxfixes)
source=("https://github.com/arisinfenix/edges/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('98e372feeae5b7309ea0360dd74b26d698329316aad1e4b2b8fba958c96604f59f6ea41a88d02362448806b040b185e8d467e599fa1325741cbdb109cc3792ec')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
