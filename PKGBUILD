# Maintainer: novica <nnovica@gmail.com>

pkgname=carrier-cli-bin
pkgver=0.2.3 # renovate: datasource=github-tags depName=joshuamarie/carrier
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

sha256sums_x86_64=('005323ca4c7bae66d130cb9156e68c85f697aa9398de5c1bcc829c3f1434e3fd'
                   'ec04d5f03c96b3c4bd5afec05f4f73536ae26765323747e5969a0760809cdc93')
sha256sums_aarch64=('005323ca4c7bae66d130cb9156e68c85f697aa9398de5c1bcc829c3f1434e3fd'
                    'ec04d5f03c96b3c4bd5afec05f4f73536ae26765323747e5969a0760809cdc93')
