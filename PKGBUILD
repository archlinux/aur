# Maintainer: Christoph Drexler <chrdr at gmx dot at>
# Contributor: hdh <hieu.d.hoang@gmail.com>

pkgname=ttf-irianis
_fontname=Irianis-Std
pkgver=1.006
pkgrel=1
pkgdesc="A serif font"
arch=('any')
conflicts=('ttf-adf')
url="http://arkandis.tuxfamily.org/adffonts.html"
license=('custom:GPL with font exception')
groups=('ttf-adf-fonts')
source=(
http://arkandis.tuxfamily.org/fonts/${_fontname}-20100729.zip
)

sha256sums=('5a252bf7fbfca67aa421798f2fbe48c2f5d46208330633499553b308ef6d3bf2')

build() {
    # nothing to do
    true
}

package() {
    mkdir -p "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/${_fontname}/TTC/"*.ttc\
                   "${pkgdir}/usr/share/fonts/TTF"

    install -Dm644 "${srcdir}/${_fontname}/NOTICE.txt"\
                   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    echo -ne "********************************************************************************\n\n"\
                >> "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cat "${srcdir}/${_fontname}/TTC/COPYING"\
                >> "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
