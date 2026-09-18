# Maintainer: novica <nnovica@gmail.com>

pkgname=rv-bin
pkgver=0.23.1 # renovate: datasource=github-tags depName=a2-ai/rv
pkgrel=1
pkgdesc="A declarative R package manager"
arch=('x86_64')
url="https://github.com/a2-ai/rv"
license=('MIT')
depends=('libgcc' 'glibc')
conflicts=('rv')
options=('!debug')
provides_x86_64=("rv=${pkgver}")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/a2-ai/rv/releases/download/v${pkgver}/rv-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
                "https://raw.githubusercontent.com/a2-ai/rv/refs/tags/v${pkgver}/LICENSE")

package() {
    cd "$srcdir"

    # Move the binary from the temporary install directory to the final location
    install -Dm755 "$srcdir/rv" "$pkgdir/usr/bin/rv"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums_x86_64=('2b4064af50840f2902038928650d750f27f0e112032f2f37e42baa825b7ae814'
                   '74fe1333138eafb27da61b5066f2f8039448ab87df0ce2d07982629c2195a520')
