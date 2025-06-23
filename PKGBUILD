# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=skm-bin
pkgver=0.8.7
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
sha256sums_aarch64=('f9b22b45c12c8b85a933267e011bf5a14212741275aed9ee210403a3dbe5e36d')
sha256sums_i686=('9ab0cb330c6cc28457069c64894c1a56aa0c812f70bd7d159a657bff8e60a342')
sha256sums_x86_64=('fbd6700b347832bd5e10b43561ff8fc2c2661cdaef972787cf366bc73fd609a9')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}