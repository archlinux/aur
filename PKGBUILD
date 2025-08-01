# Maintainer: Sourcegraph <amp-devs@sourcegraph.com>

pkgbase=ampcode
pkgname=ampcode
pkgver=0.0.1754050083
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

sha256sums_x86_64=('31a8bbdcb345bac6fea68c2fdb86f3c874818069335f7fb04812d4e4bf2e6b90')
sha256sums_aarch64=('167e5ebaace8e6d57175240cd387c2222d947339f9f74c9855bfc38f8ff109e5')

package() {
    # The downloaded binary needs to be renamed to amp for installation
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "${srcdir}/${pkgname}-${pkgver}-x86_64" "${pkgdir}/usr/bin/amp"
    elif [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "${srcdir}/${pkgname}-${pkgver}-aarch64" "${pkgdir}/usr/bin/amp"
    fi
}
