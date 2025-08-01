# Maintainer: Sourcegraph <support@sourcegraph.com>

pkgbase=ampcode
pkgname=ampcode
pkgver=0.0.1754024802
pkgrel=1
pkgdesc="An agentic coding tool, in research preview from Sourcegraph"
arch=('x86_64' 'aarch64')
url="https://ampcode.com"
license=('custom:proprietary')
depends=('ripgrep')
provides=('amp')
replaces=('sourcegraph-amp' 'ampcode-com')
conflicts=('amp')
options=('!strip')

source_x86_64=("amp-0.0.1754024802-x86_64::https://github.com/sourcegraph/amp-cli/releases/download/v0.0.1754024802/amp-linux-x64")
source_aarch64=("amp-0.0.1754024802-aarch64::https://github.com/sourcegraph/amp-cli/releases/download/v0.0.1754024802/amp-linux-arm64")

sha256sums_x86_64=('aabef5e6484aed7d2226f23160a3e08e98a0a9fe178f47c10ac25decde966f4e')
sha256sums_aarch64=('a1bb4b2a82d1bd94c68bc596e5b5bb356561c7f86835c6fca7be0603e1012161')

package() {
    # The downloaded binary needs to be renamed to amp for installation
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "${srcdir}/amp-0.0.1754024802-x86_64" "${pkgdir}/usr/bin/amp"
    elif [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "${srcdir}/amp-0.0.1754024802-aarch64" "${pkgdir}/usr/bin/amp"
    fi
}
