# Maintainer: Okazakee <okazakee@proton.me>
pkgname=tuxfans
pkgver=0.1.0
pkgrel=1
pkgdesc="Fan curve controller for TUXEDO laptops"
arch=('x86_64')
url="https://github.com/Okazakee/tuxfans"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Okazakee/tuxfans/archive/v$pkgver.tar.gz")
sha256sums=('UNCOMMITTED')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --frozen
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/tuxfans "$pkgdir/usr/bin/tuxfans"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
