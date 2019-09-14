# Maintainer: Wesley Hershberger <mggmugginsmc at gmail>
pkgname=aurum
pkgver=0.1.0
pkgrel=2
pkgdesc="An AUR helper written in Rust"
arch=('x86_64')
url="https://gitlab.com/MggMuggins/aurum"
license=('MIT')
depends=('openssl')
makedepends=('git' 'rust')
source=("git+https://gitlab.com/MggMuggins/aurum.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$pkgname"
    cargo build --release --locked
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
