# Maintainer: Jpmasr3r <https://github.com/Jpmasr3r>

pkgname=rust-rice-manager
pkgver=1.0.2
pkgrel=1
pkgdesc="A fast and flexible CLI tool to manage Linux rices using symlinks"
arch=('x86_64')
url="https://github.com/Jpmasr3r/rust-rice-manager"
license=('GPL3')
depends=()
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Jpmasr3r/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('aa3cb56a6dd0eb2b22a625a4859a49f616e277b7031f8f7faf795214d8e19c98')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    
    install -Dm755 "target/release/rrm" "$pkgdir/usr/bin/rrm"
    
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
