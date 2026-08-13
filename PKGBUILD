# Maintainer: novica <nnovica@gmail.com>

pkgname=ir-bin
pkgver=0.4.0 # renovate: datasource=github-tags depName=r-lib/ir
pkgrel=1
pkgdesc="Run standalone R scripts from embedded dependency metadata"
arch=('x86_64' 'aarch64')
url="https://github.com/r-lib/ir"
license=('MIT')
depends=('glibc' 'libgcc')
conflicts=('ir')
options=('!debug')
provides_x86_64=("ir=${pkgver}")
provides_aarch64=("ir=${pkgver}")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/r-lib/ir/releases/download/v${pkgver}/ir-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}.tar.gz::https://github.com/r-lib/ir/releases/download/v${pkgver}/ir-aarch64-unknown-linux-gnu.tar.gz")

package() {
    cd "$srcdir"/ir-*-unknown-linux-gnu

    install -Dm755 ir "$pkgdir/usr/bin/ir"
    install -Dm755 rx "$pkgdir/usr/bin/rx"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums_x86_64=('165563296b456a699fb41c67bce85e61dc6f33bdb69364acf7b12aa52ac90bb0')
sha256sums_aarch64=('165563296b456a699fb41c67bce85e61dc6f33bdb69364acf7b12aa52ac90bb0')
