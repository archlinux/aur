# $Id$
# Maintainer: Damir Jelić <poljar@termina.org.uk>

pkgbase=python-nio
_pypiname=matrix-nio
pkgname=('python-nio' 'python2-nio')
pkgver=0.4
pkgrel=1
pkgdesc='python no-IO library for the matrix chat protocol'
arch=('any')
url='https://github.com/poljar/matrix-nio'
license=('ISC')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=()
source=("https://github.com/poljar/matrix-nio/archive/$pkgver.tar.gz")
sha512sums=('7a37eebb4896e93395d2e664c03c008b6f631d43264a0b3aa71b5466b40da10d57a65e040b9fb272bf20988ca9371365647a79e2266987151e012429509e4d9e')

prepare() {
  cd "$srcdir"
  cp -a $_pypiname-$pkgver{,-py2}
}

package_python-nio() {
  depends=('python' 'python-olm' 'python-h11' 'python-h2'
           'python-jsonschema' 'python-logbook' 'python-attrs'
           'python-peewee' 'python-atomicwrites' 'python-future'
           'python-pycryptodome' 'python-unpaddedbase64')
  cd "$srcdir"/$_pypiname-$pkgver

  python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-nio() {
  depends=('python2' 'python2-olm' 'python2-h11' 'python2-h2'
           'python2-jsonschema' 'python2-logbook' 'python2-attrs'
           'python2-peewee' 'python2-atomicwrites' 'python2-typing'
           'python2-future' 'python2-pycryptodome' 'python2-unpaddedbase64')
  cd "$srcdir"/$_pypiname-$pkgver-py2

  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
