# Original autor: John Pate
# Maintainer: Niklas Hedlund nojan1989@gmail.com

pkgname=texlive-screenplay
pkgver=1.6
pkgrel=1
license=('GPL')
depends=('texlive-core')
pkgdesc="A LaTeX package for screenplay writing"
url="http://www.ctan.org/tex-archive/macros/latex/contrib/screenplay"
arch=('any')
install=texlive-screenplay.install
source=(http://mirrors.ctan.org/macros/latex/contrib/screenplay.zip)
md5sums=('57ae9a3840985984b84cfe68a607f529')

build()
{
 cd $srcdir/screenplay
 latex screenplay.ins
}

package()
{
  cd $srcdir/screenplay

  mkdir -p $pkgdir/usr/share/texmf/tex/latex/screenplay
  cp {screenplay.cls,example.tex,hardmarg.sty} $pkgdir/usr/share/texmf/tex/latex/screenplay

  mkdir -p $pkgdir/usr/share/doc/texlive-screenplay
  cp screenplay.pdf $pkgdir/usr/share/doc/texlive-screenplay/documentation.pdf
}
