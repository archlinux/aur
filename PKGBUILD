# Maintainer: everyx <lunt.luo#gmail.com>

pkgname=sing-geoip
pkgver=20221112
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
sha256sums=('91fd07cd964e938f1f2ae5b7e0d9f4a22784295adba7374c35cbc00a9b303b0c'
            '1429f6f81323537cef22aac3fa38352503ac7e0f0d7bc7d4a9095e729222395a'
            '2f02b7486bcfa90d115c71a20437f3906b6fd5bef81c5dc0efd341399e89d0fd')

package() {
    install -Dm644 "${pkgver}.geoip-cn.db" "${pkgdir}/usr/share/${pkgname}/geoip-cn.db"
    install -Dm644 "${pkgver}.geoip.db"    "${pkgdir}/usr/share/${pkgname}/geoip.db"
    install -Dm644 "${pkgver}.LICENSE"     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
