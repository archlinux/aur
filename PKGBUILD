# Maintainer: Joseph R. Quinn <quinn.josephr@protonmail.com>

pkgname=texlive-fontawesome7
pkgver=7.3.1
pkgrel=1
pkgdesc="Font Awesome 7 with LaTeX support (CTAN fontawesome7 package)"
arch=('any')
url="https://ctan.org/pkg/fontawesome7"
license=('LPPL-1.3c' 'OFL-1.1')
depends=('texlive-basic')
optdepends=('texlive-xetex: XeLaTeX/LuaLaTeX support for Font Awesome 7 Pro')
install=texlive-fontawesome7.install
provides=('texlive-fontawesome7')
conflicts=('texlive-fontsextra')
source=("https://mirrors.ctan.org/fonts/fontawesome7.zip")
sha256sums=('0fce3c7ed976c3c182c55b08b3bb603e8313fa97db583b0a7236bb7f2177c50b')

_texmf="usr/share/texmf-dist"

package() {
    cd "$srcdir/fontawesome7"

    # TeX macros (.sty, .fd, .def, .lua)
    install -dm755 "$pkgdir/$_texmf/tex/latex/fontawesome7"
    install -m644 tex/* "$pkgdir/$_texmf/tex/latex/fontawesome7/"

    # Font map
    install -dm755 "$pkgdir/$_texmf/fonts/map/dvips/fontawesome7"
    install -m644 map/fontawesome7.map "$pkgdir/$_texmf/fonts/map/dvips/fontawesome7/"

    # Encodings
    install -dm755 "$pkgdir/$_texmf/fonts/enc/dvips/fontawesome7"
    install -m644 enc/*.enc "$pkgdir/$_texmf/fonts/enc/dvips/fontawesome7/"

    # TFM metrics
    install -dm755 "$pkgdir/$_texmf/fonts/tfm/fontawesome7"
    install -m644 tfm/*.tfm "$pkgdir/$_texmf/fonts/tfm/fontawesome7/"

    # Type1 fonts
    install -dm755 "$pkgdir/$_texmf/fonts/type1/fontawesome7"
    install -m644 type1/*.pfb "$pkgdir/$_texmf/fonts/type1/fontawesome7/"

    # OpenType fonts
    install -dm755 "$pkgdir/$_texmf/fonts/opentype/fontawesome7"
    install -m644 opentype/*.otf "$pkgdir/$_texmf/fonts/opentype/fontawesome7/"

    # Documentation
    install -dm755 "$pkgdir/$_texmf/doc/latex/fontawesome7"
    install -m644 doc/* "$pkgdir/$_texmf/doc/latex/fontawesome7/"
    install -m644 README.md "$pkgdir/$_texmf/doc/latex/fontawesome7/"
}
