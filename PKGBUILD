# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=flipt-bin
pkgver=1.56.0
pkgrel=1
pkgdesc='An open source, self-hosted feature flag solution.(Prebuilt version)'
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
sha256sums_aarch64=('af6e7df5f2dbd43e352ba1552038397117cfd8d76931d2b47d918d4a7e6ea21f')
sha256sums_x86_64=('e1dacbe637a0afd866bcdd248972335da8cf6924b071347d6113ba5d07ea927a')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/config/default.yml" "${pkgdir}/etc/conf.d/${pkgname%-bin}.yml"
    install -Dm644 "${srcdir}/CHANGELOG.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}