# Maintainer: Ruben De Smet <ruben dot de dot smet at rubdos dot be>

pkgname='texlive-vub'
pkgver="1.5.0"
pkgrel=0
pkgdesc='Provides a titlepage, a beamer template and other style elements for the Vrije Universiteit Brussel.'
url='https://gitlab.com/rubdos/texlive-vub/'
license=(
 'LPPL'
)
source=(
 "https://gitlab.com/rubdos/texlive-vub/repository/archive.tar.bz2?ref=v${pkgver}"
)
sha512sums=(
 'b507c3655584f1015b7a0b5f4010bac18d0d14adf02db422da3926fa296d5bf59d6ce13782e5d2b45f43bf3b456e92661ecfac5cf04aa1fa70f5bac53314edd4'
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
 cp $dir/vub_logo_cmyk.pdf $dir/ulb_logo_3lp.eps $dir/bruface.png $dir/*.sty $pkgdir/usr/share/texmf/tex/latex/vub
}

post_install() {
 mktexlsr
}

post_remove() {
 mktexlsr
}

# vim: tabstop=1 expandtab
