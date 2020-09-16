# Maintainer: Michael Straube <michaelfstraube@gmail.com>

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
sha512sums=('ee815aa0c7d9e2abb4622c84e5b2c732e522aab61782c98ea72f0369d8826822ed2277a9c69be6331802d814beb51799f09f17f22fe5765dff15611d6b3b6776')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
