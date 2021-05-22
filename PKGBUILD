# Maintainer: Christoph Drexler <chrdr at gmx dot at>
# Contributor: hdh <hieu.d.hoang@gmail.com>

pkgname=otf-libris
_fontname=Libris-Std
pkgver=1.007
pkgrel=1
_date=20110117
pkgdesc="A sans-serif font"
arch=('any')
conflicts=('otf-adf')
url="http://arkandis.tuxfamily.org/adffonts.html"
license=('custom:GPL with font exception')
groups=('otf-adf-fonts')
source=("http://arkandis.tuxfamily.org/fonts/${_fontname}-${_date}.zip")

sha256sums=('64aec9785be5a9a22476f8ab84f5a25d11807f52d8fb6e0badd215128c8b1097')

build() {
    # nothing to do
    true
}

package() {
    mkdir -p "${pkgdir}/usr/share/fonts/OTF"
    install -Dm644 "${srcdir}/${_fontname}-${_date}/OTF/"*.otf\
                   "${pkgdir}/usr/share/fonts/OTF"

    install -Dm644 "${srcdir}/${_fontname}-${_date}/NOTICE.txt"\
                   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    echo -ne "********************************************************************************\n\n"\
                >> "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cat "${srcdir}/${_fontname}-${_date}/OTF/COPYING"\
                >> "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
