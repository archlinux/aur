# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=trunk
pkgver=0.13.1
pkgrel=1
pkgdesc='Build, bundle & ship your Rust WASM application to the web.'
arch=('x86_64')
url="https://github.com/thedodd/$pkgname/"
license=('APACHE' 'MIT')
depends=()
makedepends=('cargo')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('c9c01c9d2aff59a8fac11a4eee4879a17ace0d2262532a391b7f5e92623caae6')

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
