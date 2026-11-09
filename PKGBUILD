# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nginx-ui-bin
_pkgname='Nginx UI'
pkgver=3.0.1
pkgrel=1
pkgdesc="Yet another WebUI for Nginx."
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
sha256sums_aarch64=('a347ab5bde38e3edfd7e09c20af3c8342d09ba13e05711e13cea96989a01abb6')
sha256sums_armv7h=('5113fe641eaa24708bbd575dbc693b1e960ee3d964e1cbf79fe30bed53c74f86')
sha256sums_i686=('2f457677a75943272f69cbdb8bc0c9e0bcc77db763a459500b70e393dee34d68')
sha256sums_x86_64=('b63d41d38fa1b4a878676aec5a84ac52133eefcd5ec3ea36b2c2c42a1e977341')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/README"* -t "${pkgdir}/usr/share/docs/${pkgname%-bin}"
}
