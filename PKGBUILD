# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Paulus Cyril <paulus.cyril@gmail.com>
pkgname=latex-make
pkgver=2.2.3
pkgrel=1
pkgdesc="A collection of LaTeX packages, scipts and Makefile fragments that allows to easily compile LaTeX documents."
arch=('any')
url="https://gforge.inria.fr/projects/latex-utils/"
license=('GPL')
depends=('texlive-core' 'texlive-latexextra' 'python2')
source=(https://gforge.inria.fr/frs/download.php/latestfile/313/latex-make-${pkgver}.tar.gz)
md5sums=('84970396a9eb49fb53881ba95d9d5549')
sha256sums=('23991164cadf5376d44094096f8a397583dc80a68a9bef895912543b63bb22e8')
install=latex-make.install

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's|#!/usr/bin/env python$|#!/usr/bin/env python2|g' src/latex-make.dtx
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir" install
}
