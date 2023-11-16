# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=flipt-bin
pkgver=1.31.0
pkgrel=1
pkgdesc='An open source, self-hosted feature flag solution'
arch=('aarch64' 'x86_64')
url="https://flipt.io"
_ghurl="https://github.com/flipt-io/flipt"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_Linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_Linux_x86_64.tar.gz")
sha256sums_aarch64=('8aad895954e2a7277a430af42701cc41566a69b31e3d98c1a12acadd9137188f')
sha256sums_x86_64=('7eadb206a09b1a10e110d341dc9b1b108c8d585792151b621b67d00632ce8a67')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/config/default.yml" "${pkgdir}/etc/conf.d/${pkgname%-bin}.yml"
}