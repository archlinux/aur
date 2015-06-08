# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=ucdavisthesis
pkgver=1.2
pkgrel=1
pkgdesc="A University of California at Davis Thesis/Dissertation LaTeX Class"
arch=('any')
url="http://www.ctan.org/tex-archive/macros/latex/contrib/ucdavisthesis/"
license=('LPPL')
install=$pkgname.install
source=(http://www.tex.ac.uk/tex-archive/macros/latex/contrib/$pkgname/$pkgname.dtx \
  http://www.tex.ac.uk/tex-archive/macros/latex/contrib/$pkgname/$pkgname.ins)
md5sums=('2d377aeec1dda4c04e7a1b9a604a6346'
         'abf82464678bcc07b433dafd2e6036fb')
depends=('texlive-core')
makedepends=('coreutils')

build() {
  cd "$srcdir"
  yes | pdflatex $pkgname.ins
  yes | pdflatex $pkgname.dtx
  yes | pdflatex $pkgname.dtx 
  yes | pdflatex $pkgname.dtx
}
package() {
  cd "$srcdir"
  install -Dm644 $pkgname.pdf \
    $pkgdir/usr/share/texmf/doc/$pkgname/$pkgname.pdf 
  install -Dm644 $pkgname.cls \
    $pkgdir/usr/share/texmf/tex/latex/$pkgname/$pkgname.cls
  cp *.clo $pkgdir/usr/share/texmf/tex/latex/$pkgname
}
