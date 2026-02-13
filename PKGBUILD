# Maintainer: Eddie Brunstedt <eddie.brunstedt@protonmail.com>

pkgname=ord
pkgver=2.1.0
pkgrel=1
pkgdesc="Process text through customizable LLM templates."
arch=('x86_64')
url="https://gitlab.com/EddieBrunstedt/ord"
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl')
makedepends=('git' 'rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/EddieBrunstedt/ord/-/archive/$pkgver/ord-$pkgver.tar.gz")
sha256sums=('7be9fa8571c3ba014593c5bc7770f59dbc9b7bc82d47dafc68e3f4a0e301677c')

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
