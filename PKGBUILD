# Maintainer: Alexander Bruegmann <mail[at]abruegmann[dot]eu>
# Contributor: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgname=('python-pymisp')
_pyname=PyMISP
pkgver=2.4.127
pkgrel=1
pkgdesc="Python library to access MISP platforms via their REST API"
arch=('any')
url="https://github.com/MISP/PyMISP/"
license=('custom')
makedepends=('python' 'python-setuptools')
depends=('python' 'python-jsonschema' 'python-requests' 'python-dateutil' 'python-deprecated' 'python-cachetools')
optdepends=('lief')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/MISP/PyMISP/archive/v${pkgver}.tar.gz")
sha512sums=('d3395954c509d38f1a4a88236b01fe9635d146b53e60fc0eb408651de826613534df0a0c5cb20b183f68adc39dc3ce853ee0a0540c2c5c82171c9ba1aa5f99bb')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
