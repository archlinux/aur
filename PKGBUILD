# Maintainer: Eddie Brunstedt <eddie.brunstedt@protonmail.com>

pkgname=ord
pkgver=2.0.0
pkgrel=1
pkgdesc="Process text through customizable LLM templates."
arch=('x86_64')
url="https://gitlab.com/EddieBrunstedt/ord"
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl')
makedepends=('git' 'rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/EddieBrunstedt/ord/-/archive/$pkgver/ord-$pkgver.tar.gz")
sha256sums=('b681d8e62839ff7fc2723f3f913f0d47f65eadbe97e10c73c23e979b85aa9961')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
