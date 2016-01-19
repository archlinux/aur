# Maintainer: Yannick Forster <yannick@xmg-c404>
pkgname=texlive-mbboard
pkgver=0.4
pkgrel=1
pkgdesc="Comprehensive black-board bold fonts"
arch=('any')
url="https://www.ctan.org/tex-archive/fonts/mbboard"
license=('Knuth License')
depends=('texlive-core' 'texlive-latexextra')
install=texlive-mbboard.install
source=("http://mirrors.ctan.org/fonts/mbboard.zip")
md5sums=('00a5993a47501e6afc65c0b58fa7cf7b')

package() {
  unzip mbboard.zip -d src
  
  mkdir -p $pkgdir/usr/share/texmf/tex/latex/mbboard
  mkdir -p $pkgdir/usr/share/texmf/tex/plain/mbboard
  mkdir -p $pkgdir/usr/share/texmf/tex/generic/mbboard
  
  mkdir -p $pkgdir/usr/share/texmf/fonts/source/mbboard

  cp $srcdir/mbboard/texinputs/mbboard.sty $pkgdir/usr/share/texmf/tex/latex/mbboard
  cp $srcdir/mbboard/texinputs/mbboard.tex $pkgdir/usr/share/texmf/tex/plain/mbboard
  cp $srcdir/mbboard/texinputs/mbboard.dcl $pkgdir/usr/share/texmf/tex/generic/mbboard

  cp -R $srcdir/mbboard/source/* $pkgdir/usr/share/texmf/fonts/source/mbboard
}

# vim:set ts=2 sw=2 et:
