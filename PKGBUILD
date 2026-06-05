# Maintainer: Jon Tsiros <jon@brightblock.ai>
pkgname=hyprlayer-bin
pkgver=1.5.8
pkgrel=1
pkgdesc="CLI for managing thoughts for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/BrightBlock/hyprlayer-cli"
license=('MIT')
provides=('hyprlayer')
conflicts=('hyprlayer')
source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/BrightBlock/hyprlayer-cli/releases/download/v${pkgver}/hyprlayer-x86_64-unknown-linux-gnu")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/BrightBlock/hyprlayer-cli/releases/download/v${pkgver}/hyprlayer-aarch64-unknown-linux-gnu")
sha256sums_x86_64=('5f5b79fbeb6c34ed2f4b86f707a34b04c7b308d57589810c4cfe92e97d9e4de8')
sha256sums_aarch64=('970ccae2d42894de0901fcd227690cf7f428c2c105451d046c860996d030e270')

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "${srcdir}/${pkgname}-${pkgver}-x86_64" "$pkgdir/usr/bin/hyprlayer"
    elif [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "${srcdir}/${pkgname}-${pkgver}-aarch64" "$pkgdir/usr/bin/hyprlayer"
    fi
}
