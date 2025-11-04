# Maintainer: bgunnarsson <bjarkihg at gmail dot com>
# Contributor: Björgvin Ragnarsson

pkgname="hunspell-is"
pkgver="0.1"
pkgrel="1"
pkgdesc='Icelandic hunspell dictionary'
arch=('any')
url="https://codeberg.org/bjarki781/hunspell-is"
license=('public')
optdepends=('hunspell:  the spell checking libraries and apps')
_commit="70f26144fae8fe547710a55de265e3e38903cf38"
source=("https://codeberg.org/bjarki781/hunspell-is/archive/${_commit}.tar.gz")
sha256sums=('5aae7ee6da13f14152fddcf3aaaa93336299b1da0524549b27263e50d368b01c')

package() {
    cd "${srcdir}/${pkgname}"
    make
    install -dm755 "${pkgdir}"/usr/share/hunspell
    install -m644 dicts/is.aff "${pkgdir}"/usr/share/hunspell/is_IS.aff
    install -m644 dicts/is.dic "${pkgdir}"/usr/share/hunspell/is_IS.dic

    # license
    install -Dm644 packages/copyright "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

