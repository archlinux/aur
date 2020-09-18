# Maintainer: Michael Straube <michaelqstraube@gmail.com>

pkgname=edges
pkgver=1.0
pkgrel=3
pkgdesc="A command-line tool to set up X11 hot-corners"
arch=(x86_64)
url="https://github.com/arisinfenix/edges"
license=(MIT)
depends=(libx11 libxi libxrandr libconfig)
makedepends=(libxfixes)
source=("https://github.com/arisinfenix/edges/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('2e4b927f99342909de198ae70a9d36f66179a70b4c68e655bb68098cfa10ee405479f97b3c535096032542c8022544c196076345372657b1914aac44559f15df')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
