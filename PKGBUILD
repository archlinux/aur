# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=simple-http-server
pkgver=0.6.0
pkgrel=1
pkgdesc="Simple http server in Rust"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/TheWaWaR/simple-http-server"
license=('MIT')
depends=()
makedepends=('cargo')
options=()
source=("https://crates.io/api/v1/crates/${pkgname}/${pkgver}/download")
sha384sums=('fdab813cfcf2ca81f901aa0e69b03a38d68ecf2c9eec4130c5520ba3408915fac66c6f8bc0141823cd32b317757876c3')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
