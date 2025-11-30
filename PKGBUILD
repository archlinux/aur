# Maintainer: novica <nnovica@gmail.com>

pkgname=jarl-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Fast linter for the R language"
arch=('x86_64')
url="https://github.com/etiennebacher/jarl"
license=('MIT')
depends=('gcc-libs' 'glibc' 'zlib')
options=('!debug')
provides_x86_64=("jarl=${pkgver}")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/etiennebacher/jarl/releases/download/${pkgver}/jarl-$CARCH-unknown-linux-gnu.tar.gz"
                "https://raw.githubusercontent.com/etiennebacher/jarl/refs/tags/${pkgver}/LICENSE")
sha256sums_x86_64=('a597b183b8d7db0e740f0513d842bc171ef9f3915efb21e9e0c9fb4d6972df9d'
                   '79725ebd381352c76377a38ad2e9bf763abe79d72892f9343d609ed603733adf')

package() {
    cd "$srcdir"

    # Move the binary from the temporary install directory to the final location
    install -Dm755 "$srcdir/jarl-$CARCH-unknown-linux-gnu/jarl" "$pkgdir/usr/bin/jarl"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
