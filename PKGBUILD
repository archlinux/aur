# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nginx-ui-bin
_pkgname='Nginx UI'
pkgver=2.3.11
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
sha256sums_aarch64=('ee0e199800f3282b3cef3f34911798af9b1ca98b053b9a143da064a06190e083')
sha256sums_armv7h=('7d3f41d1ad15a8dac8a3160b1a34c5e61681028656f2da2ea90048fd24cc1b37')
sha256sums_i686=('df93c5ccae1105e5dd07be4c4254e5e4af70e4fee623334ae37344d782ab7256')
sha256sums_x86_64=('1e9e67735fa5bcf363ec31091f90ec169b3d806a5713b8d27c2087bb5c77da57')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/README"* -t "${pkgdir}/usr/share/docs/${pkgname%-bin}"
}
