# Maintainer: jojolepro <jojolepro[at]jojolepro[at]com>
pkgname=inv
_pkgcomplete=inventory-managoat
pkgver=0.1.0
pkgrel=1
url="https://github.com/jojolepro/inventory-managoat"
pkgdesc="Inventory Managoat - A Simple Inventory Manager"
depends=('gcc-libs')
makedepends=('rust' 'cargo')
license=('GPL')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jojolepro/inventory-managoat/archive/${pkgver}.tar.gz")
sha256sums=('c3ea6bb9f458a04364695b8e01c847119893fb125a5c7b681dfdf4b871be17f6')

build() {
    cd "$srcdir/$_pkgcomplete-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$_pkgcomplete-$pkgver"
    install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README"
    install -Dm 644 inv.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
}
