# Maintainer: Ruben De Smet <ruben dot de dot smet at rubdos dot be>

pkgname='texlive-vub'
pkgver="2.5.1"
pkgrel=1
pkgdesc='Provides a titlepage, a beamer template and other style elements for the Vrije Universiteit Brussel.'
url='https://gitlab.com/rubdos/texlive-vub/'
license=(
 'LPPL'
)
source=(
 "https://gitlab.com/rubdos/texlive-vub/-/archive/v${pkgver}/texlive-vub-v${pkgver}.tar.gz"
)
sha512sums=('a3d05dbf36b699d189e1563bc32063086c0e2bcb97d6619d27ad5f6b1af637ffe5118282e7ca36e6b5e87f75da92ac7993f29586d418aa833da1dc56f808e298')
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
optdepends=(
 'texlive-fontsextra: The beamer theme uses the Roboto fonts, with pdflatex.'
 'ttf-roboto: The beamer theme uses the Roboto fonts, with xelatex and lualatex.'
)
checkdepends=(
)
options=(
 '!emptydirs'
)

package() {
 dir=$srcdir/texlive-vub-v${pkgver}*

 mkdir -p $pkgdir/usr/share/texmf/tex/latex/vub
 mkdir -p $pkgdir/usr/share/texmf/tex/latex/vub/dept

 for image in vub_logo_cmyk.pdf ulb_logo_3lp.eps bruface.png; do
  cp $dir/$image $pkgdir/usr/share/texmf/tex/latex/vub;
 done
 for dept in vub-brubotics-cmyk.pdf vub-etro-cmyk.pdf vub-soft.pdf vub-ai.pdf; do
  cp $dir/dept/$dept $pkgdir/usr/share/texmf/tex/latex/vub/dept;
 done
 cp $dir/*.sty $pkgdir/usr/share/texmf/tex/latex/vub
}

post_install() {
 mktexlsr
}

post_remove() {
 mktexlsr
}

# vim: tabstop=1 expandtab
