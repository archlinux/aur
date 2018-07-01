# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=simple-http-server
pkgver=0.4.6
pkgrel=1
pkgdesc="Simple http server in Rust"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/TheWaWaR/simple-http-server"
license=('MIT')
depends=()
makedepends=('cargo')
options=()
source=("https://crates.io/api/v1/crates/${pkgname}/${pkgver}/download")
sha384sums=('48afad660d4b780ec360167c99dce03b97290237c21c3973a40fb2d38fa8c49b1d8f59368e448b25568909dbbb9793d8')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
