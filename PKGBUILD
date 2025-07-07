# Maintainer: Byson94 <byson94wastaken@gmail.com>
pkgname=xfsrtray
pkgver=1.1.0
pkgrel=1
pkgdesc="A floating and customizable system tray for Linux"
arch=('x86_64')
url="https://github.com/Byson94/xfsrtray"
license=('GPL')
depends=()
makedepends=('cargo')
provides=('xfsrtray')
conflicts=('xfsrtray-bin' 'xfsrtray-git')
source=("https://github.com/Byson94/xfsrtray/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('64e0929908361446bf58b88233b90c866e29f08a7da9b97229c38138f13b2860')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -Dm755 "target/release/xfsrtray" "$pkgdir/usr/bin/xfsrtray"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
