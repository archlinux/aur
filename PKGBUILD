# Maintainer: skyline69 <skyline@noreply.codeberg.org>
pkgname=agcp-bin
pkgver=1.2.0
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
sha256sums_x86_64=('27af967aaf5a71bed069d30fadaff9ee3c873bb50e62489afe466b0df3874c9c')
sha256sums_aarch64=('fa62c4e89e7aaf175097ca130dd418bf6227666381cd93184661dec7754d023a')

package() {
    install -Dm755 agcp "${pkgdir}/usr/bin/agcp"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
