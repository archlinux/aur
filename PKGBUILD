# Maintainer: skyline69 <skyline@noreply.codeberg.org>
pkgname=agcp-bin
pkgver=1.0.1
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
sha256sums_x86_64=('80271322e6bd5d2013794ec63c0035f41e1c7c70084379844fefd290fabdf887')
sha256sums_aarch64=('28b078a5beab639e12581effb7a68cd6fb6b29adf4420789a1d467fcd5a8e4b0')

package() {
    install -Dm755 agcp "${pkgdir}/usr/bin/agcp"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
