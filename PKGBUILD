# Maintainer: Ruben De Smet <ruben dot de dot smet at rubdos dot be>

pkgname='texlive-vub'
pkgver="2.4.1"
pkgrel=1
pkgdesc='Provides a titlepage, a beamer template and other style elements for the Vrije Universiteit Brussel.'
url='https://gitlab.com/rubdos/texlive-vub/'
license=(
 'LPPL'
)
source=(
 "https://gitlab.com/rubdos/texlive-vub/repository/archive.tar.bz2?ref=v${pkgver}"
)
sha512sums=('822eb41d219ba41e1ad81e7e92dc11614e232c07b591c5e6fea28f6e9bb28c0f5b960216ec5f63da245cbf0840074ef3b32593f8aa88664d73443fc3f1ec2532')
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
