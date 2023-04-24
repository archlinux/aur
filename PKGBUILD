# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=simple-http-server
pkgver=0.6.7
pkgrel=1
pkgdesc="Simple http server in Rust"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/TheWaWaR/simple-http-server"
license=('MIT')
depends=()
makedepends=('cargo')
options=()
source=("https://crates.io/api/v1/crates/${pkgname}/${pkgver}/download")
sha384sums=('a9c385a81c534b068ca6759ca792ef5ab574508c5a3b049d0a24643c88fc8761ef2fe0852f5c117563cce7f4dea9c8b5')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
