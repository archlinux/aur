# Maintainer: Byson94 <byson94wastaken@gmail.com>
pkgname=xfsrtray
pkgver=1.0.0
pkgrel=1
pkgdesc="A floating and customizable system tray for Linux"
arch=('x86_64')
url="https://github.com/Byson94/xfsrtray"
license=('GPL')
depends=()
makedepends=('cargo')
source=("https://github.com/Byson94/xfsrtray/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fc474faf99cd7d1fdcb2667bce63aaa56519a3027a7797e2de37dd4f9eb5b8d8')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    cargo build --release --lock
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -Dm755 "target/release/xfsrtray" "$pkgdir/usr/bin/xfsrtray"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
