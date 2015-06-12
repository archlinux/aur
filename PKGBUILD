# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=libsbml
_pkgname=libSBML
pkgver=5.10.2
pkgrel=1
pkgdesc="XML-based description language for computational models in systems biology"
url="http://sbml.org/Software/libSBML"
license=('LGPL')
arch=('i686' 'x86_64')
depends=('libxml2')
optdepends=('bzip2' 'python2' 'perl' 'ruby' 'java-runtime' 'octave' 'mono')
makedepends=('swig' 'python2' 'perl' 'java-environment')
options=('!libtool')
source=("http://sourceforge.net/projects/sbml/files/libsbml/$pkgver/stable/$_pkgname-$pkgver-core-plus-packages-src.tar.gz")
md5sums=('7d259943bf69df7aa870873a53399278')

build() {
  cd "$srcdir/$_pkgname-$pkgver-Source"

  ./configure --prefix=/usr \
      --with-python=yes --with-python-interpreter=/usr/bin/python2 \
      --with-java=no \
      --with-perl=yes \
      --with-octave=no \
      --with-csharp=no \
      --with-ruby=no \
      --with-matlab=no

  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver-Source"
  make DESTDIR="$pkgdir" install
}

