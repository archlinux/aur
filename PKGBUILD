# Maintainer: Joseph R. Quinn <quinn.josephr@protonmail.com>

pkgname=texlive-fontawesome5
pkgver=5.15.4
pkgrel=1
pkgdesc="Font Awesome 5 with LaTeX support (CTAN fontawesome5 package)"
arch=('any')
url="https://ctan.org/pkg/fontawesome5"
license=('LPPL-1.3c' 'OFL-1.1')
depends=('texlive-basic')
optdepends=('texlive-xetex: XeLaTeX/LuaLaTeX support for Font Awesome 5 Pro')
install=texlive-fontawesome5.install
provides=('texlive-fontawesome5')
conflicts=('texlive-fontsextra')
source=("https://mirrors.ctan.org/fonts/fontawesome5.zip")
sha256sums=('83c86c8a92d80e0b2c84af78a055d10798f8294f63b397ba8225351b9eaaa500')

_texmf="usr/share/texmf-dist"

package() {
    cd "$srcdir/fontawesome5"

    # TeX macros (.sty, .fd, .def, .lua)
    install -dm755 "$pkgdir/$_texmf/tex/latex/fontawesome5"
    install -m644 tex/* "$pkgdir/$_texmf/tex/latex/fontawesome5/"

    # Font map
    install -dm755 "$pkgdir/$_texmf/fonts/map/dvips/fontawesome5"
    install -m644 map/fontawesome5.map "$pkgdir/$_texmf/fonts/map/dvips/fontawesome5/"

    # Encodings
    install -dm755 "$pkgdir/$_texmf/fonts/enc/dvips/fontawesome5"
    install -m644 enc/*.enc "$pkgdir/$_texmf/fonts/enc/dvips/fontawesome5/"

    # TFM metrics
    install -dm755 "$pkgdir/$_texmf/fonts/tfm/fontawesome5"
    install -m644 tfm/*.tfm "$pkgdir/$_texmf/fonts/tfm/fontawesome5/"

    # Type1 fonts
    install -dm755 "$pkgdir/$_texmf/fonts/type1/fontawesome5"
    install -m644 type1/*.pfb "$pkgdir/$_texmf/fonts/type1/fontawesome5/"

    # OpenType fonts
    install -dm755 "$pkgdir/$_texmf/fonts/opentype/fontawesome5"
    install -m644 opentype/*.otf "$pkgdir/$_texmf/fonts/opentype/fontawesome5/"

    # Documentation
    install -dm755 "$pkgdir/$_texmf/doc/latex/fontawesome5"
    install -m644 doc/* "$pkgdir/$_texmf/doc/latex/fontawesome5/"
    install -m644 README.md "$pkgdir/$_texmf/doc/latex/fontawesome5/"
}

