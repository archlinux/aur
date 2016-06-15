# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Paulus Cyril <paulus.cyril@gmail.com>
pkgname=latex-make
pkgver=2.2.2
pkgrel=1
pkgdesc="A collection of LaTeX packages, scipts and Makefile fragments that allows to easily compile LaTeX documents."
arch=('any')
url="https://gforge.inria.fr/projects/latex-utils/"
license=('GPL')
depends=('texlive-core' 'texlive-latexextra' 'python2')
source=(https://gforge.inria.fr/frs/download.php/35547/$pkgname-$pkgver.tar.gz)
md5sums=('184abbe6c017c5c6bf0318c1a0b2b06b')
sha256sums=('8122be2409eaff5d0061d6a1ec9500f38bf14a0c3ab7c6b903ebb31697e646d9')
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
