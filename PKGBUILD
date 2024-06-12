# Maintainer: Seal <will@kimbell.uk>

pkgname=filetree-traversing
pkgver=0.1.15
pkgrel=1
pkgdesc="A Rust library for working with file trees"
arch=('x86_64')
url="https://github.com/seal/filetree-traversing"
license=('MIT')
depends=('rust' 'cargo')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')  # Replace with the actual SHA-256 checksum

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: ts=2 sw=2 et:

