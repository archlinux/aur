# Maintainer: Sourcegraph <amp-devs@sourcegraph.com>

pkgbase=ampcode
pkgname=ampcode
pkgver=0.0.1754067202
pkgrel=1
pkgdesc="An agentic coding tool, in research preview from Sourcegraph"
arch=('x86_64' 'aarch64')
url="https://ampcode.com"
license=('custom:proprietary')
depends=('ripgrep')
provides=('amp')
replaces=('sourcegraph-amp' 'ampcode')
conflicts=('amp')
options=('!strip')

source_x86_64=("${pkgname}-${pkgver}-x86_64::https://packages.ampcode.com/binaries/v${pkgver}/amp-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://packages.ampcode.com/binaries/v${pkgver}/amp-linux-arm64")

sha256sums_x86_64=('7cb2b98f798d2e908f7338739c9d389502820bb0061abf3421cdecfe5f602de2')
sha256sums_aarch64=('69a129b536d8d7b96a75a7e3b16f60a80cd3633a625effc337fec01e9fe51c91')

package() {
    # The downloaded binary needs to be renamed to amp for installation
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "${srcdir}/${pkgname}-${pkgver}-x86_64" "${pkgdir}/usr/bin/amp"
    elif [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "${srcdir}/${pkgname}-${pkgver}-aarch64" "${pkgdir}/usr/bin/amp"
    fi
}
