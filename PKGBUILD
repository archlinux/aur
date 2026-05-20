# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=skm-bin
pkgver=0.9.0
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
sha256sums_aarch64=('3bbc13f4691d50ed1fed6ebe0b5f49bca58657aa236665c7afc207b72c04e9e6')
sha256sums_i686=('e2660fcfdad653cd824e24f8a70cdd75c89ecafefddca0ad023e1b2ec40dfb44')
sha256sums_x86_64=('7240db4221069a4431a4473f52775056dee520aed6297f80b31ecb3e01a4f4d5')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
