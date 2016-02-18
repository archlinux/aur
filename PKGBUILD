# Maintainer: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>

pkgbase=python-deluge-client
pkgname=('python-deluge-client' 'python2-deluge-client')
_pkgname=deluge-client
pkgver=1.0.3
pkgrel=1
pkgdesc="Simple python Deluge Client"
url="https://pypi.python.org/pypi/deluge-client"
license=('MIT')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
source=("http://pypi.python.org/packages/source/d/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('81ff0ae9582c3f5959f8c9570bc0590e')

prepare() {
  cp -a ${_pkgname}-${pkgver}{,-python2}
}

package_python-deluge-client() {
  pkgdesc="Simple python 3 Deluge Client"
  depends=('python')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}"
}

package_python2-deluge-client() {
  pkgdesc="Simple python 2 Deluge Client"
  depends=('python2')

  cd "${srcdir}/${_pkgname}-${pkgver}-python2"
  python2 setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}"
}

# vim:set sw=2 sts=2 et:
