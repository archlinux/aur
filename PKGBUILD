# Contributor: orumin <dev@orum.in>

pkgname=otf-aoyanagi-reisyo-simo
pkgver=2.01
pkgrel=1
pkgdesc="Han old script typeface font, for Japanese"
arch=('any')
url="http://opentype.jp/aoyagireisho.htm"
license=('CUSTOM')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip-iconv')
install=ttf.install
source=("${pkgname}.zip::http://opentype.jp/bin/aoyagireisyosimo_otf_2_01.zip")
noextract=("${pkgname}.zip")
md5sums=('fd917f3615d5eddcc06c8e6fab409781')

prepare() {
    cd "${srcdir}"
    unzip -Ocp932 "${pkgname}.zip"
}

package() {
    cd "${srcdir}"

    install -d "${pkgdir}/usr/share/fonts/aoyanagireisyosimo/"
    install -m644 "aoyagireisyosimo_otf_2_01.otf" "${pkgdir}/usr/share/fonts/aoyanagireisyosimo/"

    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 "フォントの使用方法.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
