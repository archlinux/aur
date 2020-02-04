# Maintainer: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>

pkgbase=python-deluge-client
pkgname=('python-deluge-client' 'python2-deluge-client')
_pkgname=deluge-client
pkgver=1.8.0
pkgrel=1
pkgdesc="Simple python Deluge Client"
url="https://pypi.python.org/pypi/deluge-client"
license=('MIT')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/JohnDoee/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('ce6d2c29eeb5cab66f9b3a425af3e3f91e3cb5033a114a7d6088a2ab05bd08c2')

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
