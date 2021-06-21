# Maintainer: Christian Visintin
# Contributor: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=termscp
pkgver=0.5.1
pkgrel=2
pkgdesc="A feature rich terminal UI file transfer and explorer"
url="https://github.com/veeso/termscp"
license=("MIT")
arch=("any")
depends=('gcc-libs' 'zlib' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('016fdad4d4bebaef788d582020f5233a3cfbe4c1801ff6dcfa88a67a19d10a74')

build() {
   cd "$pkgname-$pkgver"
   cargo build --release --locked --target-dir=target
}

check() {
   cd "$pkgname-$pkgver"
}

package() {
   cd "$pkgname-$pkgver"
   install -Dm755 target/release/termscp -t "$pkgdir/usr/bin/"
   install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
   install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
