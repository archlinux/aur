# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_fontname=bellota
pkgname=otf-${_fontname}
pkgver=20130320
pkgrel=2
pkgdesc='Bellota OTF font.'
arch=('any')
url='http://www.fontsquirrel.com/fonts/bellota'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
install=${_fontname}.install
source=("${_fontname}.zip::http://www.fontsquirrel.com/fonts/download/${_fontname}"
        "${_fontname}.install")
sha256sums=('SKIP'
            '2059531b2e07e837034ca50e251b705a83684a2849cecf4c2955a333bfeaa2e3')

package() {
    cd "$srcdir"

    # OFL
    install -Dm0644 "SIL Open Font License.txt" "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE

    # otf files
    install -d "$pkgdir"/usr/share/fonts/OTF
    install -m0644 *.otf "$pkgdir"/usr/share/fonts/OTF/
}
