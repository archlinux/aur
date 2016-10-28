# Maintainer: Ruben De Smet <ruben dot de dot smet at rubdos dot be>

pkgname='texlive-vub'
pkgver="1.1.0"
pkgrel=2
pkgdesc='Provides the titlepage and style elements for the Vrije Universiteit Brussel.'
url='https://gitlab.com/rubdos/texlive-vub/'
license=(
 'LPPL'
)
source=(
 "https://gitlab.com/rubdos/texlive-vub/repository/archive.tar.bz2?ref=v${pkgver}"
)
sha512sums=(
 '877551845ed45de25f8541ad21bca07a06faf3a116cf1288e6abd784c3220934dbc68daae55f5a7b6d4ddd0616278f21bccabca9a032345daf794e478a2a8bad'
)
arch=(
 'any'
)
depends=(
 'texlive-core'
 'tex-gyre-fonts'
)
makedepends=(
)
checkdepends=(
)
options=(
 '!emptydirs'
)

package() {
 dir=$srcdir/texlive-vub-v1.1.0-070b96bbe5e02530c7984266679aecf477081f23
 mkdir -p $pkgdir/usr/share/texmf/tex/latex/vub
 cp $dir/vub_logo_cmyk.pdf $dir/vub.sty $pkgdir/usr/share/texmf/tex/latex/vub
}

post_install() {
 mktexsr
}

post_remove() {
 mktexlsr
}

# vim: tabstop=1 expandtab
