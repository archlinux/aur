# Maintainer: Sourcegraph <amp-devs@sourcegraph.com>

pkgbase=ampcode
pkgname=ampcode
pkgver=0.0.1755259667
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

source_x86_64=("${pkgname}-${pkgver}-x86_64::https://packages.ampcode.com/binaries/cli/v${pkgver}/amp-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://packages.ampcode.com/binaries/cli/v${pkgver}/amp-linux-arm64")

sha256sums_x86_64=('9c7d88a4f46072c0995dc292474cbbabfd1aa044be4e6a7dbb3444f7eaf2e0c2')
sha256sums_aarch64=('bfbc81821107499f3bd10a5974c508fb4383c677dcb179df6ed6b18e8d72ea7d')

package() {
    # The downloaded binary needs to be renamed to amp for installation
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "${srcdir}/${pkgname}-${pkgver}-x86_64" "${pkgdir}/usr/bin/amp"
    elif [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "${srcdir}/${pkgname}-${pkgver}-aarch64" "${pkgdir}/usr/bin/amp"
    fi
}
