# Maintainer: getjump <getjump0@gmail.com>

pkgname=nirinit
pkgver=0.1.4
pkgrel=1
pkgdesc="A session manager for Niri"
arch=('x86_64')
url="https://github.com/amaanq/nirinit"
license=('MPL-2.0')
depends=('gcc-libs')
makedepends=('cargo')
optdepends=('niri: Wayland compositor required at runtime')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amaanq/nirinit/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d85ea322b90a0fdd886e89912d3d02e4c890100667b29b00b1d2a71ca17da49e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/nirinit "$pkgdir/usr/bin/nirinit"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
