# Maintainer: Michael Straube <michaelfstraube@gmail.com>

pkgname=edges
pkgver=1.0
pkgrel=2
pkgdesc="A command-line tool to set up X11 hot-corners"
arch=(x86_64)
url="https://github.com/arisinfenix/edges"
license=(MIT)
depends=(libx11 libxi libxrandr libconfig)
makedepends=(libxfixes)
source=("https://github.com/arisinfenix/edges/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('b05ce694bf7a04821bc593dfc05619e66bd9ca910cb732cfa4e5374a20aa5f0cb64e5575e66cecae77a9a7c5a5c08bd73f6009ecf74c0768bb93597ebddf9159')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
