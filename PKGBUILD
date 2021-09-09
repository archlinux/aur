# Maintainer: Michael Straube <michael.straubej@gmail.com>

pkgname=edges
pkgver=2.0.2
pkgrel=2
pkgdesc="Command-line tool to set up hot-corners"
arch=(x86_64)
url="https://github.com/MichaelStraube/edges"
license=(GPL3)
depends=(libx11 libxi libxrandr)
makedepends=(libxfixes)
source=("https://github.com/MichaelStraube/edges/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('92bb030ce9ad06b3b99672f7efe360afa9020f5918cbfb3e22efa09042a0bba79502b492d3101d8e1cc9831d4c8794cf7d2b80273ed2f548526c6f3a613914e2')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
