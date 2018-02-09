# Maintainer: jD91mZM2 <me@krake.one>
pkgname="dino-brick"
pkgver=0.1.1
pkgrel=1
pkgdesc="Chrome's no-wifi dino game lazily ported to the terminal"
url="https://github.com/arcticmatt/dino-brick"
arch=("x86_64")
license=("BSD")
makedepends=("stack")
optdepends=()
depends=()
source=("https://github.com/arcticmatt/dino-brick/archive/$pkgver.tar.gz")
sha256sums=('d455283a1604d1daa78f6ad7b2844e2acdd1f227fc90e18f921ec84f16708a6a')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    stack build
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 "$(find .stack-work/install -type f -name dino -executable)" "$pkgdir/usr/bin/dino"
}
