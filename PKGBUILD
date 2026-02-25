# Maintainer: skyline69 <skyline@noreply.codeberg.org>
pkgname=agcp-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="Lightweight Rust proxy translating Anthropic Claude API to Google Cloud Code API"
arch=('x86_64' 'aarch64')
url="https://github.com/skyline69/agcp"
license=('MIT')
provides=('agcp')
conflicts=('agcp')

source_x86_64=("${url}/releases/download/v${pkgver}/agcp-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/agcp-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
source=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")

sha256sums=('6eaffa349d21c1c802daacce02659de6810f4cd06ab3af840815719112eba49e')
sha256sums_x86_64=('1668007ba3b822f6c808e10e90aada475bfbcb7161ac2611e41a718c15b6c574')
sha256sums_aarch64=('aa16696908d66f357559e30ac2efc981a2210720988c58b7567e64db9a31d06b')

package() {
    install -Dm755 agcp "${pkgdir}/usr/bin/agcp"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
