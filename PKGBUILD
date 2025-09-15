# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=flipt-bin
pkgver=2.1.1
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
sha256sums_aarch64=('72f9502ad6cc9e2cbde8a99a5423f6fb39b050977bc19f82c7cb410b9a33a722')
sha256sums_x86_64=('0b6049c02a3276c675db00c6b549adadac5a724be74189ad3b667c2aca8a3a2b')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    #install -Dm644 "${srcdir}/config/default.yml" "${pkgdir}/etc/conf.d/${pkgname%-bin}.yml"
    #install -Dm644 "${srcdir}/CHANGELOG.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}