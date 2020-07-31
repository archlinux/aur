# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=simple-http-server
pkgver=0.6.1
pkgrel=1
pkgdesc="Simple http server in Rust"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/TheWaWaR/simple-http-server"
license=('MIT')
depends=()
makedepends=('cargo')
options=()
source=("https://crates.io/api/v1/crates/${pkgname}/${pkgver}/download")
sha384sums=('193325ab445de444dc2be09c1dc9dcdb5438f913d2deb5c402cfa0a2fec638da2d244458928afe2cf7d36c9469cf1c25')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
