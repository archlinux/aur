# Maintainer: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>

pkgbase=python-deluge-client
pkgname=('python-deluge-client' 'python2-deluge-client')
_pkgname=deluge-client
pkgver=1.0.5
pkgrel=1
pkgdesc="Simple python Deluge Client"
url="https://pypi.python.org/pypi/deluge-client"
license=('MIT')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/JohnDoee/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('7089b8661b7b8158c2945eb2e9bedb229df55ac9d3233133b8f98b575e142558')

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

# vim:set sw=2 sts=2 ft=sh et:
