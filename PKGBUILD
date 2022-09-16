# Maintainer: everyx <lunt.luo#gmail.com>

pkgname=sing-geoip
pkgver=20220912
pkgrel=1

pkgdesc='sing-geoip database'
arch=('any')
_repo="SagerNet/${pkgname}"
url="https://github.com/${_repo}"
license=('GPL3')

optdepends=('sing-box: The universal proxy platform')

source=("${pkgver}.geoip-cn.db::${url}/releases/download/${pkgver}/geoip-cn.db"
        "${pkgver}.geoip.db::${url}/releases/download/${pkgver}/geoip.db"
        "${pkgver}.LICENSE::https://raw.githubusercontent.com/${_repo}/${pkgver}/LICENSE")
sha256sums=('057b085cdd6cd505e2ff59196305064821d88c3932d2eb08551c2ff9ce73cb27'
            'ad19c7cc8f74e5481d0c1b0a1f0c673070c71d9757824e8f3dafeac78edc194b'
            '2f02b7486bcfa90d115c71a20437f3906b6fd5bef81c5dc0efd341399e89d0fd')

package() {
    install -Dm644 "${pkgver}.geoip-cn.db" "${pkgdir}/usr/share/${pkgname}/geoip-cn.db"
    install -Dm644 "${pkgver}.geoip.db"    "${pkgdir}/usr/share/${pkgname}/geoip.db"
    install -Dm644 "${pkgver}.LICENSE"     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
