# Maintainer: Alexander Bruegmann <mail[at]abruegmann[dot]eu>
# Contributor: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgname=('python-pymisp')
_pyname=PyMISP
pkgver=2.4.121
pkgrel=1
pkgdesc="Python library to access MISP platforms via their REST API"
arch=('any')
url="https://github.com/MISP/PyMISP/"
license=('custom')
makedepends=('python' 'python-setuptools' 'lief')
depends=('python' 'python-jsonschema' 'python-requests' 'python-dateutil' 'python-deprecated' 'python-cachetools' 'lief')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/MISP/PyMISP/archive/v${pkgver}.tar.gz")
sha512sums=('8a0e5c81d590a9e26d0097181189608996c2fb4b9a733cae638fe74503d147bb04b55a6420378ac060b8f798a5f030d619cc225c74b5c07dc6b4475bc4dc0442')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
