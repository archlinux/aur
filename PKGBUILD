pkgname=ascii-2048
pkgver=1.0.1
pkgrel=1
pkgdesc="2048 game for terminal in ASCII"
arch=('any')
url="https://github.com/d3b0o/ascii-2048"
license=('MIT')
depends=('bash' 'make' 'gcc')
source=("https://github.com/d3b0o/ascii-2048/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('648a5601465f3e20b84739089bbedcae90aeedc05accf17c05e3e62c8cf112ec')

build() {
    cd "$srcdir/ascii-2048-${pkgver}"
    make
}

package() {
    cd "$srcdir/ascii-2048-${pkgver}"
    install -Dm755 2048 "$pkgdir/usr/bin/ascii-2048"
    install -Dm644 "$srcdir/../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
