# Maintainer: Christoph Drexler <chrdr at gmx dot at>
# Contributor: hdh <hieu.d.hoang@gmail.com>

pkgname=ttf-symbols-adf
_fontname=SymbolsADF
pkgver=1.001
pkgrel=1
pkgdesc="Two fonts of symbols, named 'Arrows ADF' and 'Bullets ADF'"
arch=('any')
conflicts=('ttf-adf')
url="http://arkandis.tuxfamily.org/adffonts.html"
license=('custom:GPL with font exception')
groups=('ttf-adf-fonts')
source=(
http://arkandis.tuxfamily.org/fonts/SymbolADF.zip
)

sha256sums=('4d8b7e7af9e3fa8149398f515d564200161fa3ca33423dee3b1e6b90d030e780')

build() {
    # nothing to do
    true
}

package() {
    mkdir -p "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/${_fontname}/TTF/"*.ttf\
                   "${pkgdir}/usr/share/fonts/TTF"

    install -Dm644 "${srcdir}/${_fontname}/NOTICE"\
                   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    echo -ne "********************************************************************************\n\n"\
                >> "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cat "${srcdir}/${_fontname}/TTF/COPYING"\
                >> "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    sed -e "s/\r//g" -i "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
