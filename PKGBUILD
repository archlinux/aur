# Maintainer: Ruben De Smet <ruben dot de dot smet at rubdos dot be>

pkgname='texlive-vub'
pkgver="1.3.1"
pkgrel=1
pkgdesc='Provides a titlepage, a beamer template and other style elements for the Vrije Universiteit Brussel.'
url='https://gitlab.com/rubdos/texlive-vub/'
license=(
 'LPPL'
)
source=(
 "https://gitlab.com/rubdos/texlive-vub/repository/archive.tar.bz2?ref=v${pkgver}"
)
sha512sums=(
 '9dbdb29121cf346d4dee2cb476e88ed0cb64abaa7775c11c854689d375279e3410a94472ca0cd0ebec331a89e849049765ba100396e161253848f2ca103e91c2'
)
arch=(
 'any'
)
depends=(
 'texlive-core'
 'tex-gyre-fonts'
 'texlive-latexextra'
 'ttf-roboto'
)
makedepends=(
)
checkdepends=(
)
options=(
 '!emptydirs'
)

package() {
 dir=$srcdir/texlive-vub-v${pkgver}*
 mkdir -p $pkgdir/usr/share/texmf/tex/latex/vub
 cp $dir/vub_logo_cmyk.pdf $dir/*.sty $pkgdir/usr/share/texmf/tex/latex/vub
}

post_install() {
 mktexsr
}

post_remove() {
 mktexlsr
}

# vim: tabstop=1 expandtab
