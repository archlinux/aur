# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=trunk
pkgver=0.18.0
pkgrel=1
pkgdesc='Build, bundle & ship your Rust WASM application to the web.'
arch=('x86_64')
url="https://github.com/thedodd/$pkgname/"
license=('APACHE' 'MIT')
depends=()
makedepends=('cargo')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('b19d6fa45e1fab883badb9a2ba92277ac1bae6139e67d90459fbdf4247cd3a65')

build() {
    cd "$pkgname-$pkgver"

    cargo build --release
}

check() {
    cd "$pkgname-$pkgver"

    cargo test --release
}

package(){
    cd "$pkgname-$pkgver"

    install --mode 755 -D --target-directory "$pkgdir/usr/bin" target/release/trunk
    install --mode 644 -D --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE-MIT
    install --mode 644 -D --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE-APACHE
}
