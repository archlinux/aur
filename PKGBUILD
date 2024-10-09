# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nginx-ui-bin
_pkgname="Nginx UI"
pkgver=2.0.0_beta.36
pkgrel=1
pkgdesc="Yet another WebUI for Nginx.Prebuilt version."
arch=(
    'aarch64'
    'armv7h'
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
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-linux-arm32-v7a.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-linux-32.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-linux-64.tar.gz")
sha256sums_aarch64=('d4821e9f9536af7d47175c605c479b67ce92448e7e5306574d3d40ed08bf5b67')
sha256sums_armv7h=('09dde971423401c4411c89f57f6ae8f92a25610d2d1097066ceafcce76327af4')
sha256sums_i686=('839218417d76df2501e49459166425afb7f321b498a7807693b53b8e8f6484b7')
sha256sums_x86_64=('4ba46be4cb03164ea5a1dad084d592b3b0c3342797eccbd32ae2d301f3bb0721')
package() {
   install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
   install -Dm644 "${srcdir}/README"* -t "${pkgdir}/usr/share/docs/${pkgname%-bin}"
}