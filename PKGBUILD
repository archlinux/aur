# Maintainer: Ruben De Smet <ruben dot de dot smet at rubdos dot be>

pkgname='texlive-vub'
pkgver="1.2.0"
pkgrel=1
pkgdesc='Provides the titlepage and style elements for the Vrije Universiteit Brussel.'
url='https://gitlab.com/rubdos/texlive-vub/'
license=(
 'LPPL'
)
source=(
 "https://gitlab.com/rubdos/texlive-vub/repository/archive.tar.bz2?ref=v${pkgver}"
)
sha512sums=(
 'a5eebcf19ef723ab98c8b2b3ecedebfe8fa36043ddf3a504cabc790eb918b2394961308499207e83da007c8e4507217b1ff3ba7d482ebc13579faa8b7f2637f8'
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
 dir=$srcdir/texlive-vub-v1.2.0-6d454cd5f11abcf9649405846137707a30155927
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
