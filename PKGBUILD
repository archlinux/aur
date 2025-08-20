# Maintainer: yangniao23 <yangniao23 (at) gmail (dot) com>

pkgname=ttf-genjyuu-gothic
pkgver=20150607
pkgrel=1
pkgdesc="Japanese TrueType font processed in a round gothic style based on Source Han Sans"
url="http://jikasei.me/font/genjyuu/"
license=('custom:SIL Open Font License 1.1')
arch=('any')
install=$pkgname.install
source=("https://ftp.iij.ad.jp/pub/osdn.jp/users/8/8636/genjyuugothic-${pkgver}.7z"
        "https://ftp.iij.ad.jp/pub/osdn.jp/users/8/8638/genjyuugothic-x-${pkgver}.7z"
        "https://ftp.iij.ad.jp/pub/osdn.jp/users/8/8635/genjyuugothic-l-${pkgver}.7z"
)
sha256sums=(
    '1997876351985ac9e2ea7a7a809c91e3fdaef878ece5b830f2512c882c3e49db'
    '553967bdf0066069e4f687c81ded9c7d7bc1abcbd32d9177efc2bf85e7f8037a'
    '698007a5783e97e821b929d0e57f74446a86dece5032fe576897356586f76cbb'
)

package() {
    cd "${srcdir}"
    install -dm755 "${pkgdir}"/usr/share/fonts/TTF
    install -m644 *.ttf "${pkgdir}"/usr/share/fonts/TTF/
    install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 SIL_Open_Font_License_1.1.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
