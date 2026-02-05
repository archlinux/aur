# Maintainer: novica <nnovica@gmail.com>

pkgname=jarl-bin
pkgver=0.4.0
pkgrel=2
pkgdesc="Fast linter for the R language"
arch=('x86_64')
url="https://github.com/etiennebacher/jarl"
license=('MIT')
depends=('gcc-libs' 'glibc' 'zlib')
conflicts=('jarl')
options=('!debug')
provides_x86_64=("jarl=${pkgver}")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/etiennebacher/jarl/releases/download/${pkgver}/jarl-$CARCH-unknown-linux-gnu.tar.gz"
                "https://raw.githubusercontent.com/etiennebacher/jarl/refs/tags/${pkgver}/LICENSE")
sha256sums_x86_64=('255dd329b7207a12b2ed9cb2da095d38c18ebc19dffd65df2a01d4824bffda64'
                   '79725ebd381352c76377a38ad2e9bf763abe79d72892f9343d609ed603733adf')

package() {
    cd "$srcdir"

    # Move the binary from the temporary install directory to the final location
    install -Dm755 "$srcdir/jarl-$CARCH-unknown-linux-gnu/jarl" "$pkgdir/usr/bin/jarl"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
