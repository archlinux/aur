# Maintainer: Michael Straube <michael.straubej@gmail.com>

pkgname=edges
pkgver=2.0.1
pkgrel=1
pkgdesc="A command-line tool to set up X11 hot-corners"
arch=(x86_64)
url="https://github.com/arisinfenix/edges"
license=(GPL3)
depends=(libx11 libxi libxrandr)
makedepends=(libxfixes)
source=("https://github.com/arisinfenix/edges/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('24f7aa17ad755a6c4644ac8a9fa20e14802d64635851aeba428f907aa9d6621c9236e31bf16b8178a97c2d16e311e122b70ab19c3f0e0db080508292594e73d8')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
