# Maintaoner: Yamada Hayao <development@fascode.net>

pkgname="madoka-magica-fonts"
pkgver=20210205
pkgrel=1
pkgdesc="Fonts for Puella Magi Madoca magica"
arch=('any')
url="https://wiki.puella-magi.net/Deciphering_the_runes#Fonts"
license=('custom')
depends=()
makedepends=()
source=(
    # MadokaRunes
    "https://www.dropbox.com/s/n6ys414nviitr9y/MadokaRunes-2.0.ttf"

    # Musical Font
    "https://download2269.mediafire.com/nfawo5exnqtg/muzsvbsg4cu2shu/MadokaMusical.ttf"

    # Madoka Font
    "http://www.jarchive.org/akami/aka063.zip"

    # Maficum Texturae
    "http://hwm3.gyao.ne.jp/shiroi-niwatori/nkf11_magicum_texturae.zip"

    # MadokaLetters
    "MadokaLetters.ttf::https://www.mediafire.com/file/891iu9c9e2j1tig/MadokaLetters.ttf"
)

md5sums=(
    "SKIP"
    'SKIP'
    'SKIP'
    'SKIP'
    "SKIP"
)

package() {
    local font_list=(
        $(find "${srcdir}" -name '*.ttf' | xargs -If realpath f)
        $(find "${srcdir}" -name '*.otf' | xargs -If realpath f)
    )

    for font in ${font_list[@]}; do
        install -m 755 -D "${font}" "${pkgdir}/usr/share/fonts/madoka-magica/$(basename "${font}")"
    done
}
