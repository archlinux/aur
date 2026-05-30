# Maintainer: Nikita Bilous <nikita@bilous.me>
# Contributor: Nikita Bilous <nikita@bilous.me>

pkgname=kras
pkgver=0.4.3
pkgrel=1
pkgdesc="Detect, highlight and pretty print almost any structured data inside plain text"
arch=('x86_64')
url="https://github.com/acidnik/kras-rs"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/acidnik/kras-rs/archive/v$pkgver.tar.gz")
sha256sums=('b87d14ce354085cc1e9c7452a3f9bfa641c3e9d64fe87f2dbe8cc3c7e2ed42ba')

build() {
    cd "$srcdir/$pkgname-rs-$pkgver"
    cargo build --release --frozen
}

package() {
    cd "$srcdir/$pkgname-rs-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
