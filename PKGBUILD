# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=trunk
pkgver=0.18.6
pkgrel=1
pkgdesc='Build, bundle & ship your Rust WASM application to the web.'
arch=('x86_64')
url="https://github.com/thedodd/$pkgname/"
license=('APACHE' 'MIT')
depends=()
makedepends=('cargo')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('4d0602df875ff26ac9d3473f4818075b645ce2680aaa8b7e6d217c8c9f65f186')

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
