# Maintainer: Alexander Bruegmann <mail[at]abruegmann[dot]eu>
# Contributor: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgbase=python-pymisp
_pyname=PyMISP
pkgname=('python-pymisp' 'python2-pymisp')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
pkgver=2.4.117
pkgrel=1
pkgdesc="Python library to access MISP platforms via their REST API"
arch=('any')
url="https://github.com/MISP/PyMISP/"
license=('custom')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/MISP/PyMISP/archive/v${pkgver}.tar.gz")
sha512sums=('b8c9436567f37491704d5f2b69b073003292caed5322ba8c2acf85e63ee1fc6afe8c162d40fd1717c99bf140fc0b51ca2a4534f014b666b18f6fd00976905075')

package_python-pymisp() {
  depends=('python' 'python-jsonschema' 'python-requests' 'python-dateutil' 'python-deprecated' 'python-cachetools')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-pymisp() {
  depends=('python2' 'python2-jsonschema' 'python2-requests' 'python2-dateutil' 'python2-deprecated' 'python2-enum34' 'python2-functools32' 'python2-cachetools')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python2 setup.py install -O1 --root="${pkgdir}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
