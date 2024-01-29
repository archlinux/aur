# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=trunk
pkgver=0.18.7
pkgrel=1
pkgdesc='Build, bundle & ship your Rust WASM application to the web.'
arch=('x86_64')
url="https://github.com/thedodd/$pkgname/"
license=('APACHE' 'MIT')
depends=()
makedepends=('cargo')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('6d8ef3e02fefc537b85c0ae8eeb533475c7f46e8a4247156ac6677fb09718b5b')

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
