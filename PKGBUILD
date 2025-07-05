# Maintainer: Byson94 <byson94wastaken@gmail.com>
pkgname=xfsrtray
pkgver=1.0.2
pkgrel=1
pkgdesc="A floating and customizable system tray for Linux"
arch=('x86_64')
url="https://github.com/Byson94/xfsrtray"
license=('GPL')
depends=()
makedepends=('cargo')
source=("https://github.com/Byson94/xfsrtray/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('689b7da73eb26bc28a435638bd3afa93f8db350c0690a7ef240e67727d2212e9')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -Dm755 "target/release/xfsrtray" "$pkgdir/usr/bin/xfsrtray"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
