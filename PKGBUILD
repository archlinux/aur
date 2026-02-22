# Maintainer: skyline69 <skyline@noreply.codeberg.org>
pkgname=agcp-bin
pkgver=1.3.0
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
sha256sums_x86_64=('61cc723e077f5920f1db1cf9dcda873f285cdf133a01e02de357f3e7200679c6')
sha256sums_aarch64=('7fb9179f6334bdc30f187424e26d6432feb1004cc52a8b97fc9f5eb198f66881')

package() {
    install -Dm755 agcp "${pkgdir}/usr/bin/agcp"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
