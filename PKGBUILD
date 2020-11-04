# Maintainer: peippo <christoph.fink@gmail.com>

_fnt_name=fanwood
pkgname=otf-$_fnt_name
pkgdesc="A serif font based on the work of a famous Czech-American type designer of yesteryear."
url="https://www.theleagueofmoveabletype.com/$_fnt_name"
license=("custom:OFL")

pkgver=20110526
pkgrel=1
arch=("any")

groups=("lmt-fonts")

source=("$pkgname-$pkgver.zip::https://github.com/theleagueof/${_fnt_name}/archive/master.zip")
sha256sums=("343377b57551358d8f9778ff5f3123ed34257334f25522c0f294f8c96812f5a7")

package() {
    for _fontfile in \
        "Fanwood.otf" \
        "Fanwood Italic.otf" \
        "Fanwood Text.otf" \
        "Fanwood Text Italic.otf"
    do
        install \
            -Dm644 \
            "${srcdir}/${_fnt_name}-master/${_fontfile}" \
            "${pkgdir}/usr/share/fonts/OTF/${_fontfile}"
    done

    install \
        -Dm644 \
            "${srcdir}/${_fnt_name}-master/Open Font License.markdown" \
            "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
}
