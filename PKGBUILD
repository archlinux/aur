
pkgname=ccp_tree
pkgver=0.1.4
pkgrel=1
pkgdesc="AI-friendly project tree generator"
arch=('x86_64' 'aarch64')
url="https://github.com/AradPilevarJavid/ccp_tree"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')

source=("$pkgname-$pkgver.tar.gz::https://github.com/AradPilevarJavid/ccp_tree/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('db4091faeda85d0bcaf4b21cea219ce1514fc7ba39c88d1e98252eb23fe2259a')

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



