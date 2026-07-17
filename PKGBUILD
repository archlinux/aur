
pkgname=ccp_tree
pkgver=0.1.5
pkgrel=1
pkgdesc="ccp: 📄 Snapshot, 📋 blueprint, 🏗️ scaffold. Instantly capture project structure & files to Markdown/.tree, then regenerate anywhere."
arch=('x86_64' 'aarch64')
url="https://github.com/AradPilevarJavid/ccp_tree"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')

source=("$pkgname-$pkgver.tar.gz::https://github.com/AradPilevarJavid/ccp_tree/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('144271f115b3c1574fca33e53cc8398338db2d9aaaa9f173d79279bfc54c017f')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 target/release/ccp "$pkgdir/usr/bin/ccp"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}



