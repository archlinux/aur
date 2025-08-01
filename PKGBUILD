# Maintainer: Sourcegraph <amp-devs@sourcegraph.com>

pkgbase=ampcode
pkgname=ampcode
pkgver=0.0.1754078719
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

sha256sums_x86_64=('3357bb48ec7816ffff6754f1e2231218aa166e9ddf5be72f56ca33f01abe1443')
sha256sums_aarch64=('1d39d7e96e5247e191b64dffb8eddee7a7d504eda63581a796c8e4e99ef5c109')

package() {
    # The downloaded binary needs to be renamed to amp for installation
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "${srcdir}/${pkgname}-${pkgver}-x86_64" "${pkgdir}/usr/bin/amp"
    elif [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "${srcdir}/${pkgname}-${pkgver}-aarch64" "${pkgdir}/usr/bin/amp"
    fi
}
