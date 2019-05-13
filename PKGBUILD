# Maintainer: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>

pkgbase=python-deluge-client
pkgname=('python-deluge-client' 'python2-deluge-client')
_pkgname=deluge-client
pkgver=1.7.1
pkgrel=1
pkgdesc="Simple python Deluge Client"
url="https://pypi.python.org/pypi/deluge-client"
license=('MIT')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/JohnDoee/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('c2826cec50e729a124449fad633e0054f6d6d0383e9e3665e87a2e1bc70d22fb')

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
