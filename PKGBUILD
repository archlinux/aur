# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Paulus Cyril <paulus.cyril@gmail.com>
pkgname=latex-make
pkgver=2.4.0
pkgrel=1
pkgdesc="A collection of LaTeX packages, scipts and Makefile fragments that allows to easily compile LaTeX documents."
arch=('any')
url="https://gforge.inria.fr/projects/latex-utils/"
license=('GPL')
depends=('texlive-core' 'texlive-latexextra' 'python')
optdepends=('inkscape: use of figlatex'
            'fig2dev: use of figlatex'
            'ghostscript: use of figlatex')
source=(https://gforge.inria.fr/frs/download.php/latestfile/313/latex-make-${pkgver}.tar.gz)
md5sums=('69e9fdf922e91ee3992075863b4acc03')
sha256sums=('0aafaf5d0cf99d205899084e65c998b52b13906ad8860cab6b9604e4d4f60cb3')
install=latex-make.install

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir" install
}
