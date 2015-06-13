# Contributor: orumin <dev@orum.in>

pkgname=ttf-vlkoruri
pkgver=20140915
pkgrel=1
pkgdesc="Japanese TrueType font obtained by mixing VL P Gothic and Open Sans"
arch=('any')
url="http://osdn.jp/projects/koruri"
license=('CUSTOM')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
_mirror="iij"
source=("VlKoruri-${pkgver}.tar.xz::http://osdn.jp/frs/redir.php?m=${_mirror}&f=%2Fkoruri%2F61965%2FVlKoruri-${pkgver}.tar.xz")
md5sums=('28831b09019e2bac953833aba6ef85be')

package() {
    cd "${srcdir}"

    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 "VlKoruri-${pkgver}/Apache License v2.0.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -m644 "VlKoruri-${pkgver}/LICENSE_E.mplus" "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -m644 "VlKoruri-${pkgver}/LICENSE_J.mplus" "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -m644 "VlKoruri-${pkgver}/VL_LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -m644 "VlKoruri-${pkgver}/VL_LICENSE.en" "${pkgdir}/usr/share/licenses/${pkgname}/"

    install -d "${pkgdir}/usr/share/fonts/TTF"
    install -m644 "VlKoruri-${pkgver}"/*.ttf "${pkgdir}/usr/share/fonts/TTF"
}
