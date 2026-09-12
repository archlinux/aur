# Maintainer: novica <nnovica@gmail.com>

pkgname=carrier-cli-bin
pkgver=0.2.2 # renovate: datasource=github-tags depName=joshuamarie/carrier
pkgrel=1
pkgdesc="A module manager for {box} modules"
arch=('x86_64' 'aarch64')
url="https://github.com/joshuamarie/carrier"
license=('MIT')
depends=('glibc' 'libgcc')
conflicts=('carrier-cli')
options=('!debug')
provides_x86_64=("carrier-cli=${pkgver}")
provides_aarch64=("carrier-cli=${pkgver}")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/joshuamarie/carrier/releases/download/v${pkgver}/carrier-x86_64-unknown-linux-gnu.tar.gz"
               "LICENSE::https://raw.githubusercontent.com/joshuamarie/carrier/refs/tags/v${pkgver}/LICENSE.md")
source_aarch64=("${pkgname}-${pkgver}.tar.gz::https://github.com/joshuamarie/carrier/releases/download/v${pkgver}/carrier-aarch64-unknown-linux-gnu.tar.gz"
                "LICENSE::https://raw.githubusercontent.com/joshuamarie/carrier/refs/tags/v${pkgver}/LICENSE.md")

package() {
    cd "$srcdir"/carrier-*-unknown-linux-gnu

    install -Dm755 carrier "$pkgdir/usr/bin/carrier-cli"
    install -Dm644 "$srcdir/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums_x86_64=('97349d21b1b8e65bbfac878c1b047f70aa566b1446e20e34daaaec066c1f8963'
                   'ec04d5f03c96b3c4bd5afec05f4f73536ae26765323747e5969a0760809cdc93')
sha256sums_aarch64=('a9b8c964166380a9d30523a769eb20d2a3c8fe80cb6f9268258012475df4defb'
                    'ec04d5f03c96b3c4bd5afec05f4f73536ae26765323747e5969a0760809cdc93')
