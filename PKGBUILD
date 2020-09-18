# Maintainer: Michael Straube <michael.straubej@gmail.com>

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
sha512sums=('bb53c27cc9e058511728dea14c444df0653e2d27c26a857a0d4e3478bc3e389b70d1b2ed5a6d8091ea75dc2ed80ae87ee3b9e3ba884377ef06fcbcadfd6b9d2d')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
