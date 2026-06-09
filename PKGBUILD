# Maintainer: Okazakee <okazakee@proton.me>
pkgname=tuxfans
pkgver=0.2.0
pkgrel=1
pkgdesc="Fan curve controller for TUXEDO laptops"
arch=('x86_64')
url="https://github.com/Okazakee/tuxfans"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Okazakee/tuxfans/archive/v$pkgver.tar.gz")
sha256sums=('1db27a2ad44f1517f3c30ef997bd9504b6763c833962f3b4739e0c13f6b9745d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --frozen
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/tuxfans "$pkgdir/usr/bin/tuxfans"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
