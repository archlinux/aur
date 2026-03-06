# Maintainer: NotiLo-A <ninedefix@proton.me>
pkgname=fan
pkgver=1.0.0
pkgrel=1
pkgdesc="ThinkPad fan control via /proc/acpi/ibm/fan"
arch=('x86_64')
url="https://github.com/NotiLo-A/fan"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/NotiLo-A/fan/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2e9e5d49e31f983b923674568559813becfdee4719024925c55e997ea31c4df6')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/fan "$pkgdir/usr/bin/fan"
}
