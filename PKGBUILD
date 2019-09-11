# $Id$
# Maintainer: Damir Jelić <poljar@termina.org.uk>

pkgbase=python-nio
_pypiname=matrix-nio
pkgname=('python-nio' 'python2-nio')
pkgver=0.6
pkgrel=1
pkgdesc='python no-IO library for the matrix chat protocol'
arch=('any')
url='https://github.com/poljar/matrix-nio'
license=('ISC')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=()
source=("https://github.com/poljar/matrix-nio/archive/$pkgver.tar.gz")
sha512sums=('6d6ef95f32823a83c8a7d2de6ca9edbdc9f1c5d0923d67b419cbe48829935f32176deaf7c24b8c073839e04e1d362791bfed6537a4025221db0904f998eb1a43')

prepare() {
  cd "$srcdir"
  cp -a $_pypiname-$pkgver{,-py2}
}

package_python-nio() {
  depends=('python' 'python-olm' 'python-h11' 'python-h2'
           'python-jsonschema' 'python-logbook' 'python-attrs'
           'python-peewee' 'python-atomicwrites' 'python-future'
           'python-pycryptodome' 'python-unpaddedbase64' 'python-aiohttp'
           'python-cachetools')
  cd "$srcdir"/$_pypiname-$pkgver

  python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-nio() {
  depends=('python2' 'python2-olm' 'python2-h11' 'python2-h2'
           'python2-jsonschema' 'python2-logbook' 'python2-attrs'
           'python2-peewee' 'python2-atomicwrites' 'python2-typing'
           'python2-future' 'python2-pycryptodome' 'python2-unpaddedbase64'
           'python2-cachetools')
  cd "$srcdir"/$_pypiname-$pkgver-py2

  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
