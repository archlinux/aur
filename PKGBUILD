# Maintainer: everyx <lunt.luo#gmail.com>

pkgname=sing-geoip
pkgver=20230612
pkgrel=2

pkgdesc='sing-geoip database'
arch=('any')
_repo="SagerNet/${pkgname}"
url="https://github.com/${_repo}"
license=('GPL3')

source=("${pkgver}.geoip-cn.db::${url}/releases/download/${pkgver}/geoip-cn.db"
        "${pkgver}.geoip.db::${url}/releases/download/${pkgver}/geoip.db"
        "${pkgver}.LICENSE::https://raw.githubusercontent.com/${_repo}/${pkgver}/LICENSE")
sha256sums=('1fb7a9cb83ded674fc8bd2f50318a2a9df585e3e82263825d444cdef3de809f2'
            'df17a493509ff22b70472c1750c6d2cd4dd35c6480a607e46ffccc22b83c38e4'
            '2f02b7486bcfa90d115c71a20437f3906b6fd5bef81c5dc0efd341399e89d0fd')

package() {
    install -Dm644 "${pkgver}.geoip-cn.db" "${pkgdir}/usr/share/${pkgname}/geoip-cn.db"
    install -Dm644 "${pkgver}.geoip.db"    "${pkgdir}/usr/share/${pkgname}/geoip.db"
    install -Dm644 "${pkgver}.LICENSE"     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
