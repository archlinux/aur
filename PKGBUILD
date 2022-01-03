# Maintainer: Felipe Garcia <hello@sazz.space>
pkgname="nazuna"
pkgver=1.0.2
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
sha256sums=("1659aa533ae05f941f5426474a40e2756d0e4a3de50785fbf7c119e4f6d5d3ce")

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
}

