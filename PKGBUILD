# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=simple-http-server
pkgver=0.6.14
pkgrel=1
pkgdesc="Simple http server in Rust"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/TheWaWaR/simple-http-server"
license=('MIT')
depends=()
makedepends=('cargo')
options=()
source=("https://crates.io/api/v1/crates/${pkgname}/${pkgver}/download")
sha384sums=('02d8608d09c8c124601e53cf7766e2770985b90eaf58f54c45c30c848069c62e20c94e2b65c467e6393d9900c2e8ed2a')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
