# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=flipt-bin
pkgver=2.14.0
pkgrel=1
pkgdesc='The Git-native, enterprise-ready feature management platform that developers love.'
arch=(
    'aarch64'
    'x86_64'
)
url="https://flipt.io"
_ghurl="https://github.com/flipt-io/flipt"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_Linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_Linux_x86_64.tar.gz")
sha256sums_aarch64=('9e774bb1c044d45963c89327fd6871ce9b0737b76cb47bbf4be3ce19ecbc66ca')
sha256sums_x86_64=('e62e91b44181b2d36a22192fb94c679e74309dbb6e617231021967c11dc0fb2f')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    #install -Dm644 "${srcdir}/config/default.yml" "${pkgdir}/etc/conf.d/${pkgname%-bin}.yml"
    #install -Dm644 "${srcdir}/CHANGELOG.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
