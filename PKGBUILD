# Maintainer: Ruben De Smet <ruben dot de dot smet at rubdos dot be>

pkgname='texlive-vub'
pkgver="3.0.0"
pkgrel=1
pkgdesc='Provides a titlepage, a beamer template and other style elements for the Vrije Universiteit Brussel.'
url='https://gitlab.com/rubdos/texlive-vub/'
license=(
 'LPPL'
)
source=(
 "https://gitlab.com/rubdos/texlive-vub/-/archive/v${pkgver}/texlive-vub-v${pkgver}.tar.gz"
)
sha512sums=('c05737fcb80b89dd6b57cc8b8fc69152b8510dd13b3b580fb820510dd702fc25370d1a3678731345e1bd1ba606ea2e99809a82640c166ed3bd53bd954a8081fd')
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
