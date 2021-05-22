# Maintainer: Christoph Drexler <chrdr at gmx dot at>
# Contributor: hdh <hieu.d.hoang@gmail.com>

pkgname=otf-electrum
_fontname=Electrum-Exp
pkgver=1.005
pkgrel=1
_date=20100711
pkgdesc="A serif font"
arch=('any')
conflicts=('otf-adf')
url="http://arkandis.tuxfamily.org/adffonts.html"
license=('custom:GPL with font exception')
groups=('otf-adf-fonts')
source=(
http://arkandis.tuxfamily.org/fonts/${_fontname}-${_date}.zip
)

sha256sums=('ab7053d7fec89e34c190852073ba212e133858df007beb14ed68199efd32a858')

build() {
    # nothing to do
    true
}

package() {
    mkdir -p "${pkgdir}/usr/share/fonts/OTF"
    install -Dm644 "${srcdir}/${_fontname}/OTF/"*.otf\
                   "${pkgdir}/usr/share/fonts/OTF"

    install -Dm644 "${srcdir}/${_fontname}/NOTICE.txt"\
                   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    echo -ne "********************************************************************************\n\n"\
                >> "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cat "${srcdir}/${_fontname}/OTF/COPYING"\
                >> "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
