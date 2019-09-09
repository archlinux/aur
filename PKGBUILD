# $Id$
# Maintainer: Damir Jelić <poljar@termina.org.uk>

pkgbase=python-nio
_pypiname=matrix-nio
pkgname=('python-nio' 'python2-nio')
pkgver=0.5
pkgrel=1
pkgdesc='python no-IO library for the matrix chat protocol'
arch=('any')
url='https://github.com/poljar/matrix-nio'
license=('ISC')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=()
source=("https://github.com/poljar/matrix-nio/archive/$pkgver.tar.gz")
sha512sums=('0ca4c5398f189e9a7525553123a70a9fa2741fcbe7e92839a4c44ea1e752192b293c3fa815fe689ac5645cb8ea7b3f7faaecaf0d723dc1e075cbaa5fbd1cd6d9')

prepare() {
  cd "$srcdir"
  cp -a $_pypiname-$pkgver{,-py2}
}

package_python-nio() {
  depends=('python' 'python-olm' 'python-h11' 'python-h2'
           'python-jsonschema' 'python-logbook' 'python-attrs'
           'python-peewee' 'python-atomicwrites' 'python-future'
           'python-pycryptodome' 'python-unpaddedbase64' 'python-aiohttp')
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
