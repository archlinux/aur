# Maintainer: Ruben De Smet <ruben dot de dot smet at rubdos dot be>

pkgname='texlive-vub'
pkgver="2.1.4"
pkgrel=0
pkgdesc='Provides a titlepage, a beamer template and other style elements for the Vrije Universiteit Brussel.'
url='https://gitlab.com/rubdos/texlive-vub/'
license=(
 'LPPL'
)
source=(
 "https://gitlab.com/rubdos/texlive-vub/repository/archive.tar.bz2?ref=v${pkgver}"
)
sha512sums=('4f87bcb19af499f0ba4e0123f8a037b9c88d3c635ddc7bad8ac53547cd704d92e9f1be1519639d6f2a58aa67edbc73b34f0702610a27495e2f8900d0802d6ab6')
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
