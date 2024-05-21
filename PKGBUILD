# Maintainer: Eric TK <ericatkusa@gmail.com>
pkgname=clearch
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple CLI tool written in Rust"
arch=('x86_64')
url="https://github.com/Zane-Dev14/ClearchOnlyTar"
license=('MIT')
depends=('glibc')
makedepends=('rust' 'cargo')
source=("https://github.com/Zane-Dev14/ClearchOnlyTar/raw/main/clearch-cli-0.1.0.tar.gz")
sha256sums=('SKIP')
build() {
    cd "$srcdir"
    cargo build --release --locked --all-features --target-dir=target
}
package() {
    install -Dm755 "$srcdir/target/release/clearch" "$pkgdir/usr/bin/clearch"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
