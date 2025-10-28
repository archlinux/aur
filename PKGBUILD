# Maintainer: Sleep-No-More <sleepnomore@example.com>
pkgname=cpmenu
pkgver=0.4.0
pkgrel=1
pkgdesc="Modern circular menu for Wayland (legacy package, use snmenu instead)"
arch=("x86_64")
url="https://github.com/Sleep-No-More/SNMenu"
license=("MIT")
depends=("gtk3" "cairo")
makedepends=("cargo" "rust")
source=("snmenu-${pkgver}.tar.gz::https://github.com/Sleep-No-More/SNMenu/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("SKIP")

build() {
    cd "SNMenu-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "SNMenu-${pkgver}"
    install -Dm755 target/release/snmenu "$pkgdir/usr/bin/cpmenu"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
