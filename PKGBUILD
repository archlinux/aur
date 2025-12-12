pkgname=refresh
pkgver=0.1.0
pkgrel=1
pkgdesc="A lightweight command-line project manager"
arch=('x86_64')
url="https://github.com/Ametrine-cc/refresh"
license=('MPL-2.0')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Ametrine-cc/refresh/archive/v$pkgver.tar.gz")
sha256sums=('218f5b115d9905aab7ab6c2594d4d14a7a05cfffaab3528a5fcb20ddf1f54950')

build() {
  cd "refresh-0.1.0"
  cargo build --release --locked
}

check() {
  cd "refresh-0.1.0"
  cargo test --release --locked
}

package() {
  cd "refresh-0.1.0"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
