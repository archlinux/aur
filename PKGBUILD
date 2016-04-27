# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=ucdavisthesis
pkgver=1.3
pkgrel=1
pkgdesc="A University of California at Davis Thesis/Dissertation LaTeX Class"
arch=('any')
url="http://www.ctan.org/tex-archive/macros/latex/contrib/ucdavisthesis/"
license=('LPPL')
install=$pkgname.install
source=(http://tug.ctan.org/tex-archive/macros/latex/contrib/$pkgname/$pkgname.dtx \
  http://tug.ctan.org/tex-archive/macros/latex/contrib/$pkgname/$pkgname.ins)
md5sums=('e1a6176faa7653ef12f46e55ce70a0b8'
         '40025977a358b86b3f389551e03fa878')
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
