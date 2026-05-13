# Maintainer: Jon Tsiros <jon@brightblock.ai>
pkgname=hyprlayer-bin
pkgver=1.5.6
pkgrel=1
pkgdesc="CLI for managing thoughts for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/BrightBlock/hyprlayer-cli"
license=('MIT')
provides=('hyprlayer')
conflicts=('hyprlayer')
source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/BrightBlock/hyprlayer-cli/releases/download/v${pkgver}/hyprlayer-x86_64-unknown-linux-gnu")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/BrightBlock/hyprlayer-cli/releases/download/v${pkgver}/hyprlayer-aarch64-unknown-linux-gnu")
sha256sums_x86_64=('822577272d748ba5ed6b9d66bffe053bbd7929da46ea905ca9504fe28e8f3f72')
sha256sums_aarch64=('6eb57945d3793e677ebb9dba8484cfdf34aef976359d5c4378761ce8b34e37ee')

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "${srcdir}/${pkgname}-${pkgver}-x86_64" "$pkgdir/usr/bin/hyprlayer"
    elif [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "${srcdir}/${pkgname}-${pkgver}-aarch64" "$pkgdir/usr/bin/hyprlayer"
    fi
}
