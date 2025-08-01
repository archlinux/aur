# Maintainer: Sourcegraph <amp-devs@sourcegraph.com>

pkgbase=ampcode
pkgname=ampcode
pkgver=0.0.1754069994
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

sha256sums_x86_64=('7139089880e69f29deb89ad7d748db8bd139dd462d1947aea803e41f03d99ffc')
sha256sums_aarch64=('d5fd7b908c736c3bb6729f70fc750b0f6807dc1b0e74d367556b1ae35949071a')

package() {
    # The downloaded binary needs to be renamed to amp for installation
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "${srcdir}/${pkgname}-${pkgver}-x86_64" "${pkgdir}/usr/bin/amp"
    elif [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "${srcdir}/${pkgname}-${pkgver}-aarch64" "${pkgdir}/usr/bin/amp"
    fi
}
