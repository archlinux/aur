# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

# Maintainer: peippo <christoph.fink@gmail.com>

_fnt_name=fanwood
pkgname=otf-$_fnt_name
pkgdesc="A serif font based on the work of a famous Czech-American type designer of yesteryear."
url="https://www.theleagueofmoveabletype.com/$_fnt_name"
license=("custom:OFL")

pkgver=20110526
pkgrel=2
arch=("any")

groups=("lmt-fonts")

source=("$pkgname-$pkgver.zip::https://github.com/theleagueof/${_fnt_name}/archive/master.zip")
b2sums=(
    "eb0d579d9ff0509b72600fd188babb5aaa5ff12025296ea88986962cf6a45a2e20decd67e706a2e27ad2d1451b37a9ade84c34e6c23df5ebfe092b931677b005"
)

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
