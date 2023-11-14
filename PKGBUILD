# Maintainer: everyx <lunt.luo#gmail.com>

pkgname=sing-geoip
pkgver=20231112
pkgrel=1

pkgdesc='sing-geoip database'
arch=('any')
_repo="SagerNet/${pkgname}"
url="https://github.com/${_repo}"
license=('GPL3')

source=("${pkgver}.geoip-cn.db::${url}/releases/download/${pkgver}/geoip-cn.db"
        "${pkgver}.geoip.db::${url}/releases/download/${pkgver}/geoip.db"
        "${pkgver}.LICENSE::https://raw.githubusercontent.com/${_repo}/${pkgver}/LICENSE")
sha256sums=('12468b0ff55e19f362cfef00f723bb42cc9d45f8b596c302ffce6582d6b05215'
            '5d310b9f52cbdfda2115933f4ea6e73704700c49b2475f4d1c4f567cfc80d9cb'
            '2f02b7486bcfa90d115c71a20437f3906b6fd5bef81c5dc0efd341399e89d0fd')

package() {
    install -Dm644 "${pkgver}.geoip-cn.db" "${pkgdir}/usr/share/${pkgname}/geoip-cn.db"
    install -Dm644 "${pkgver}.geoip.db"    "${pkgdir}/usr/share/${pkgname}/geoip.db"
    install -Dm644 "${pkgver}.LICENSE"     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
