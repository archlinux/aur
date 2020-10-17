# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=python2-secrets
pkgver=1.0.5
pkgrel=1
pkgdesc="Backport of Python 3.6's secrets module for Python 2.7"
arch=('any')
url="https://github.com/scaleway/python2-secrets"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('34247a592e31efb85342a4055ffc64c15da6cbf08b48fdd75d839c4d24b992ed938880d350a0f3fbbef6def48475fe40c426cf15d417478d3c96b895a73d34d8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python2 setup.py install --root="${pkgdir}" --optimize=1
}
