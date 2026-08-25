# Maintainer: Jon Tsiros <jon@brightblock.ai>
pkgname=hyprlayer-bin
pkgver=1.6.1
pkgrel=1
pkgdesc="CLI for managing thoughts for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/BrightBlock/hyprlayer-cli"
license=('MIT')
provides=('hyprlayer')
conflicts=('hyprlayer')
source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/BrightBlock/hyprlayer-cli/releases/download/v${pkgver}/hyprlayer-x86_64-unknown-linux-gnu")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/BrightBlock/hyprlayer-cli/releases/download/v${pkgver}/hyprlayer-aarch64-unknown-linux-gnu")
sha256sums_x86_64=('393f3878aacc2abd52595b1e038a46b5ebd431b5379796e4674c23cd6bf79f2d')
sha256sums_aarch64=('2a250a84df8933b715fa11d35e3e2836468a7582686469229688c10e269df5d0')

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "${srcdir}/${pkgname}-${pkgver}-x86_64" "$pkgdir/usr/bin/hyprlayer"
    elif [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "${srcdir}/${pkgname}-${pkgver}-aarch64" "$pkgdir/usr/bin/hyprlayer"
    fi
}
