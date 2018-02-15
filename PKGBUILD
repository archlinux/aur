# Maintainer: Barry Smith <brrtsm@gmail.com>
pkgname=python2-xdot
_pyname=xdot
pkgver=0.6
pkgrel=1
pkgdesc="Interactive viewer for graphs. Python2 version"
url='https://github.com/jrfonseca/xdot.py'
arch=('any')
license=('LGPL')
depends=('python2-setuptools')
source=(https://pypi.python.org/packages/1e/f7/24050b7f897c547fa18e4e6f0fc744da100b821da69e9f966808c67eb979/${_pyname}-${pkgver}.tar.gz)
md5sums=('a8e5fc5208657b03ad1bd4c46de75724')

package() {
  cd "${_pyname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Change xdot.py to use python2 instead of python3
  #sed -i -e '1s:#!/usr/bin/env python:#!/usr/bin/env python2:' "${pkgdir}/usr/lib/python2.7/site-packages/${_pyname}.py"

  # Don't want to overwrite the python3 version
  rm -rf "${pkgdir}/usr/bin"
}
