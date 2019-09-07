# Maintainer: Alexander Bruegmann <mail[at]abruegmann[dot]eu>
# Contributor: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgbase=python-pymisp
_pyname=PyMISP
pkgname=('python-pymisp' 'python2-pymisp')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
pkgver=2.4.114
pkgrel=1
pkgdesc="Python library to access MISP platforms via their REST API"
arch=('any')
url="https://github.com/MISP/PyMISP/"
license=('custom')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/MISP/PyMISP/archive/v${pkgver}.tar.gz")
sha512sums=('74a6df7a8ad1a15184011bda5360df1bc3f4c399e67aa5bc98771735cda7d865c6e9041c3b8bc2b72857cc2059fd5d355781363c65c83d0d61b0a562b1d4307e')

package_python-pymisp() {
  depends=('python' 'python-jsonschema' 'python-requests' 'python-dateutil' 'python-deprecated')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-pymisp() {
  depends=('python2' 'python2-jsonschema' 'python2-requests' 'python2-dateutil' 'python2-deprecated' 'python2-enum34' 'python2-functools32')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python2 setup.py install -O1 --root="${pkgdir}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
