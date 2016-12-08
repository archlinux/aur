# Maintainer: Ruben De Smet <ruben dot de dot smet at rubdos dot be>

pkgname='texlive-vub'
pkgver="1.3.0"
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
 '0a6b7478b7a317fd3164195fdf746938b3502aa53483bb5be9526002bbaee45c3f2e486636ddaf566da67ac3045513ff13505cf3225835a2ddf7dd8dddd9ce69'
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
 dir=$srcdir/texlive-vub-v1.3.0-54eac30da93e210b80c2472855890c7f95733b11
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
