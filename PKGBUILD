# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=one-api-bin
_pkgname='One API'
pkgver=0.6.10
pkgrel=1
pkgdesc="LLM API management & key redistribution system, unifying multiple providers under a single API. Single binary, Docker-ready, with an English UI.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://openai.justsong.cn/"
_ghurl="https://github.com/songquanpeng/one-api"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
optdepends=(
    'sqlite: for database backend'
    'redis: for cache backend'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/songquanpeng/one-api/v${pkgver}/LICENSE"
    "README-${pkgver}.md::https://raw.githubusercontent.com/songquanpeng/one-api/v${pkgver}/README.en.md"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-arm64")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}")
sha256sums=('e965b65a52d90708ffeeb9632e1928cab08bc7ae1424d8407e42fc372bce6506'
            'd0fa64a96f197d1368264a76e152b9b7049c8fe41c4938626367aaccf27abe72')
sha256sums_aarch64=('e44f678cfd15758d9d61f37b3ae5de66217f4cb8a551823c3c867c73b0a87633')
sha256sums_x86_64=('e891ff7c9502ecf1dfe9c02062a2c945286a05b01134e857c2343d7f0db2ca18')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
}