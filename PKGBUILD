# Maintainer: Felipe Garcia <hello@sazz.space>
pkgname="nazuna"
pkgver=1.0.0
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
sha256sums=("39b1ad785b01661ac3cd9b6269d860c9198cf6915d034ba2b43506e48a6a3b49")

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
}

