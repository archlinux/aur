# Maintainer: novica <nnovica@gmail.com>

pkgname=jarl-bin
pkgver=0.7.1 # renovate: datasource=github-releases depName=etiennebacher/jarl
pkgrel=1
pkgdesc="Fast linter for the R language"
arch=('x86_64')
url="https://github.com/etiennebacher/jarl"
license=('MIT')
depends=('gcc-libs' 'glibc' 'zlib')
conflicts=('jarl')
options=('!debug')
provides_x86_64=("jarl=${pkgver}")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/etiennebacher/jarl/releases/download/${pkgver}/jarl-x86_64-unknown-linux-gnu.tar.gz"
                "https://raw.githubusercontent.com/etiennebacher/jarl/refs/tags/${pkgver}/LICENSE")
sha256sums_x86_64=('5aba4e47baec90cecb4aa4fc11ab71ca3d177d0265b3d7b6fe8cc54b7965b6a9'
                   '79725ebd381352c76377a38ad2e9bf763abe79d72892f9343d609ed603733adf')

package() {
    cd "$srcdir"

    # Move the binary from the temporary install directory to the final location
    install -Dm755 "$srcdir/jarl-x86_64-unknown-linux-gnu/jarl" "$pkgdir/usr/bin/jarl"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
