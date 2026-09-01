# Maintainer: Sleep-No-More <nninkovic95@gmail.com>
pkgname=snmenu
pkgver=0.5.0
pkgrel=1
pkgdesc="Modern circular menu for Wayland desktop environments with submenu support"
arch=('x86_64')
url="https://github.com/Sleep-No-More/SNMenu"
license=('MIT')
depends=('gtk3' 'cairo')
makedepends=('cargo' 'rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Sleep-No-More/SNMenu/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d43ad81c5dc876b09544f02c75de20c590771cf1920a5423541c3f8e4ba529da')

build() {
    cd "SNMenu-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "SNMenu-${pkgver}"
    install -Dm755 target/release/snmenu "$pkgdir/usr/bin/snmenu"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
