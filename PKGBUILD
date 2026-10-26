# Maintainer: Jon Tsiros <jon@brightblock.ai>
pkgname=hyprlayer-bin
pkgver=1.6.3
pkgrel=1
pkgdesc="CLI for managing thoughts for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/BrightBlock/hyprlayer-cli"
license=('MIT')
provides=('hyprlayer')
conflicts=('hyprlayer')
source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/BrightBlock/hyprlayer-cli/releases/download/v${pkgver}/hyprlayer-x86_64-unknown-linux-gnu")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/BrightBlock/hyprlayer-cli/releases/download/v${pkgver}/hyprlayer-aarch64-unknown-linux-gnu")
sha256sums_x86_64=('1fa8a800911b50aa868697af83d2f2ab9224f92a2b89e7f247675ebbfb87ecbe')
sha256sums_aarch64=('7d3eb452741b1ea8cd96552209d91a0401943d42bf66693d7036062293cdf839')

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "${srcdir}/${pkgname}-${pkgver}-x86_64" "$pkgdir/usr/bin/hyprlayer"
    elif [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "${srcdir}/${pkgname}-${pkgver}-aarch64" "$pkgdir/usr/bin/hyprlayer"
    fi
}
