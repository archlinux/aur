# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=chyle-bin
pkgver=1.19.0
pkgrel=1
pkgdesc="Changelog generator: use a git repository and various data sources and publish the result on external services.(Prebuilt version)"
arch=('x86_64')
url='https://github.com/antham/chyle'
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz"
)
sha256sums=('85b8c4f10297f40cde7dc7f734056952fd5248545fb14888ce198e248448c7c0')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}