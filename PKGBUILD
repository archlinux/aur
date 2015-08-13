# Contributor: Guenther Starnberger <gst@sysfrog.org>
# Maintainer:  Artiom Molchanov <ar.molchanov@gmail.com>

pkgname=python2-pyscard-svn
pkgver=1.6.16
pkgrel=3
pkgdesc="pyscard is a Python module adding smart cards support to Python"
arch=('i686' 'x86_64')
url="http://pyscard.sourceforge.net/"
license='LGPL'
depends=('python2' 'pcsclite')
conflicts=('pyscard' 'python2-pyscard')
makedepends=('swig' 'subversion')
source=('svn+https://svn.code.sf.net/p/pyscard/code/#revision=612')
md5sums=('SKIP')

_pkgname=pyscard

build() {
  cd "$srcdir/code/trunk/$_pkgname/src"

  python2 setup.py build_ext
}

package() {
  cd "$srcdir/code/trunk/$_pkgname/src"
  python2 setup.py install --prefix=$pkgdir/usr
}
