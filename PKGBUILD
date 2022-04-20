# Maintainer: Felipe Garcia <hello@sazz.space>
pkgname="nazuna"
pkgver=1.0.3
pkgrel=1
pkgdesc="Download Twitter videos using your terminal!"
arch=("i686" "x86_64")
url="https://github.com/Sazzo/nazuna"
license=("GPL3")
depends=("openssl")
makedepends=("rust" "cargo")
provides=()
conflicts=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=("70a9e5c874f71fbd1e0e6bb9ea0d9ee44ee384f0c024dbfe9d49a6e7ed2a1cf6")

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
}

