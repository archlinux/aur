# Maintainer: execrooted <execrooted@gmail.com>

pkgname=root_rain
pkgver=0.1.3
pkgrel=1
pkgdesc="A colorful terminal weather animation tool written in Rust (rain and snow effects)"
arch=('x86_64')
url="https://github.com/execrooted/root_rain"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("rr.sh")
sha256sums=('b723b92484a23c2ec7f19c6a08b57d9a60a4f9711025e1668f05c23c7e740c10')

build() {
    cargo build --release --locked
}

package() {
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm755 "rr.sh" "$pkgdir/usr/bin/rr"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

