# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=utask-bin
pkgver=1.29.1
pkgrel=2
pkgdesc="An automation engine that models and executes business processes declared in yaml"
arch=('x86_64')
url='https://github.com/ovh/utask'
license=('BSD')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_Linux_${CARCH}.tar.gz"
)
sha256sums=('8056a8fdcb944a53ecf787d995f3bd7d96fbecd5eb7774aba2a1a2040664b14b')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}