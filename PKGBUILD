# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=skm-bin
pkgver=0.8.9
pkgrel=1
pkgdesc="A simple and powerful SSH keys manager"
arch=(
    'aarch64'
    'i686'
    'x86_64'
)
url="https://timothyye.github.io/skm"
_ghurl="https://github.com/TimothyYe/skm"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_arm64.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_386.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_amd64.tar.gz")
sha256sums_aarch64=('30237531054234cb150cd8188abbb13d0f4f015791cb2c0e97e755af6cf19651')
sha256sums_i686=('7e5fe4888407764ca0c1d867b8255d6c4189299c1c2e6eb17813f003d05d9f12')
sha256sums_x86_64=('0f3617e1174f24eeca13d7f55dc86b1f1e3a33bfcfd07a91c67c4acd0e728247')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
