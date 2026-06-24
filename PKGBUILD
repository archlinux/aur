# Maintainer: novica <nnovica@gmail.com>

pkgname=jarl-bin
pkgver=0.5.0 # renovate: datasource=github-tags depName=etiennebacher/jarl
pkgrel=1
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
sha256sums_x86_64=('71c24e7dbb6b327bdb1b0d94efa948f4f62f077d97f09b1c66a81040b17060aa'
                   '79725ebd381352c76377a38ad2e9bf763abe79d72892f9343d609ed603733adf')

package() {
    cd "$srcdir"

    # Move the binary from the temporary install directory to the final location
    install -Dm755 "$srcdir/jarl-$CARCH-unknown-linux-gnu/jarl" "$pkgdir/usr/bin/jarl"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
