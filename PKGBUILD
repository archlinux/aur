# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgbase=python-voluptuous-serialize
pkgname=('python-voluptuous-serialize' 'python2-voluptuous-serialize')
pkgver=2.0.0
pkgrel=1
pkgdesc="Convert voluptuous schemas to JSON."
arch=('any')
url='https://github.com/balloob/voluptuous-serialize'
license=('LGPL')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python' 'python2')
source=("https://github.com/balloob/voluptuous-serialize/archive/${pkgver}.tar.gz")
sha256sums=('e4d3b7a5bc2859e6c566079ecb757fc7332efb805e7bde336a217bfd7064d098')

check() {
  cd "${srcdir}/voluptuous-serialize-${pkgver}"
  python setup.py test
  python2 setup.py test
}

package_python-voluptuous-serialize() {
  depends=('python-voluptuous')
  pkgdesc="Convert voluptuous schemas to JSON. (python3 version)"

  cd "${srcdir}/voluptuous-serialize-${pkgver}"
  python setup.py install --root=${pkgdir} 
}

package_python2-voluptuous-serialize() {
  depends=('python2-voluptuous')
  pkgdesc="Convert voluptuous schemas to JSON. (python2 version)"

  cd "${srcdir}/voluptuous-serialize-${pkgver}"
  python2 setup.py install --root=${pkgdir} 
}

# vim:set ts=2 sw=2 et:
