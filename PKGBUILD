# Maintainer: Oleksandr Tymkovych <sashaty1109@gmail.com>

pkgname=waysn
pkgver=0.1.0
pkgrel=3
pkgdesc="Gamma adjustments for Wayland"
arch=('x86_64')
url="https://github.com/SashaT9/waysn"
license=('MIT')

makedepends=('rust')
depends=('glibc' 'gcc-libs')

source=("$pkgname-$pkgver.tar.gz::https://github.com/SashaT9/$pkgname/archive/v$pkgver.tar.gz")

sha256sums=('03a6855e2bef65b695f53e094c19ec468ae93d21f4e6b9203938e0aa571580a9')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/waysn"
    install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/waysn-daemon" "$pkgdir/usr/bin/waysn-daemon"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
