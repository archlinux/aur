# Maintainer: Michael Straube <michael.straubej@gmail.com>

pkgname=edges
pkgver=2.0.0
pkgrel=1
pkgdesc="A command-line tool to set up X11 hot-corners"
arch=(x86_64)
url="https://github.com/arisinfenix/edges"
license=(GPL3)
depends=(libx11 libxi libxrandr)
makedepends=(libxfixes)
source=("https://github.com/arisinfenix/edges/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('5dca6b832a915b1d7dff845787d2386f1ca6b3799563b236cc2ff779581596b3e1157656f3de569b8dc85894d6c5577e7fb2a32f896ef134a6c2cc14646f5c55')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
