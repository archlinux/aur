# Maintainer: Jon Tsiros <jon@brightblock.ai>
pkgname=hyprlayer-bin
pkgver=1.6.2
pkgrel=1
pkgdesc="CLI for managing thoughts for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/BrightBlock/hyprlayer-cli"
license=('MIT')
provides=('hyprlayer')
conflicts=('hyprlayer')
source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/BrightBlock/hyprlayer-cli/releases/download/v${pkgver}/hyprlayer-x86_64-unknown-linux-gnu")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/BrightBlock/hyprlayer-cli/releases/download/v${pkgver}/hyprlayer-aarch64-unknown-linux-gnu")
sha256sums_x86_64=('32f7581f6f7df4842a38d067469df4b4416eb3109a6cfcddd3245d120d90f64c')
sha256sums_aarch64=('2d139c39c50fd0043eee3e6ace60b30701f9c630604a957cdf3c97ce01b20f79')

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "${srcdir}/${pkgname}-${pkgver}-x86_64" "$pkgdir/usr/bin/hyprlayer"
    elif [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "${srcdir}/${pkgname}-${pkgver}-aarch64" "$pkgdir/usr/bin/hyprlayer"
    fi
}
