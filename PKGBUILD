# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nginx-ui-bin
_pkgname='Nginx UI'
pkgver=3.0.4
pkgrel=1
pkgdesc="Yet another WebUI for Nginx."
arch=(
    'aarch64'
#    'armv7h'
    'i686'
    'x86_64'
)
url="https://nginxui.com/"
_ghurl="https://github.com/0xJacky/nginx-ui"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'nginx'
)
options=(
    '!strip'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-linux-arm64-v8a.tar.gz")
#source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-linux-arm32-v7a.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-linux-32.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-linux-64.tar.gz")
sha256sums_aarch64=('86e39b5c7fe85198b9275d2d04b5c9f562fbd114070d503e127c9723f457dd34')
#sha256sums_armv7h=('56a497a0a8b1c358899230243bd6a6da329e71b0028afa2c1419b1189d5ced0d')
sha256sums_i686=('38bc693b03baf63c73923c92105d0e329befdb5202ccd1743dfdb0a4f4ec24d8')
sha256sums_x86_64=('bb85700b8d15e3bb21d91d62fe888c385732b30e23c7882c1d34054898c1c6c0')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/README"* -t "${pkgdir}/usr/share/docs/${pkgname%-bin}"
}
