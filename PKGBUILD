# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=utask-bin
pkgver=1.34.0
pkgrel=1
pkgdesc="An automation engine that models and executes business processes declared in yaml.(Prebuilt version)"
arch=('x86_64')
url='https://github.com/ovh/utask'
license=('BSD-3-Clause')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_Linux_${CARCH}.tar.gz"
)
sha256sums=('53b8c2b649a76a13aec7f6253b8bf03a3069845aea62c56de914a2cd3f17ddcf')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
