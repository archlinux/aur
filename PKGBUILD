# Maintainer: Byson94 <byson94wastaken@gmail.com>
pkgname=xfsrtray
pkgver=1.0.1
pkgrel=1
pkgdesc="A floating and customizable system tray for Linux"
arch=('x86_64')
url="https://github.com/Byson94/xfsrtray"
license=('GPL')
depends=()
makedepends=('cargo')
source=("https://github.com/Byson94/xfsrtray/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4ced7c5288f46cf658922c849cf6bc0016151be7771f3a8fa75501c6ecbd71a5')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -Dm755 "target/release/xfsrtray" "$pkgdir/usr/bin/xfsrtray"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
