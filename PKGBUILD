# Maintainer: novica <nnovica@gmail.com>

pkgname=rv-bin
pkgver=0.18.0
pkgrel=1
pkgdesc="A declarative R package manager"
arch=('x86_64')
url="https://github.com/a2-ai/rv"
license=('MIT')
depends=('libgcc' 'glibc')
conflicts=('rv')
options=('!debug')
provides_x86_64=("rv=${pkgver}")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/a2-ai/rv/releases/download/v${pkgver}/rv-v${pkgver}-$CARCH-unknown-linux-gnu.tar.gz"
                "https://raw.githubusercontent.com/a2-ai/rv/refs/tags/v${pkgver}/LICENSE")
sha256sums_x86_64=('d80195db9613f983c6c7beadd609aca65755538f567ac26fb7a532558bcfef30'
                   '74fe1333138eafb27da61b5066f2f8039448ab87df0ce2d07982629c2195a520')



package() {
    cd "$srcdir"

    # Move the binary from the temporary install directory to the final location
    install -Dm755 "$srcdir/rv" "$pkgdir/usr/bin/rv"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
