# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Paulus Cyril <paulus.cyril@gmail.com>
pkgname=latex-make
pkgver=2.2.5
pkgrel=1
pkgdesc="A collection of LaTeX packages, scipts and Makefile fragments that allows to easily compile LaTeX documents."
arch=('any')
url="https://gforge.inria.fr/projects/latex-utils/"
license=('GPL')
depends=('texlive-core' 'texlive-latexextra' 'python')
source=(https://gforge.inria.fr/frs/download.php/latestfile/313/latex-make-${pkgver}.tar.gz)
md5sums=('564bf9e7a4257b2bd270e3750ebe88c9')
sha256sums=('dc3b30fd71077e1fa114c4d6811fae03b7e394be247a5556fbe672d009aa6311')
install=latex-make.install

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir" install
}
