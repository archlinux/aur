# Maintainer: Alexander Bruegmann <mail[at]abruegmann[dot]eu>
# Contributor: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgbase=python-pymisp
_pyname=PyMISP
pkgname=('python-pymisp' 'python2-pymisp')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
pkgver=2.4.113
pkgrel=1
pkgdesc="Python library to access MISP platforms via their REST API"
arch=('any')
url="https://github.com/MISP/PyMISP/"
license=('custom')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/MISP/PyMISP/archive/v${pkgver}.tar.gz")
sha512sums=('bf7b5b6cc618f5cd355658b506bbbadbbcf019f63caa4d5ffad14b20ecf02587f0a90bf20c846a65372356e51fca4ae084520dd0a6d3e068ae176482e5114dfe')

package_python-pymisp() {
  depends=('python' 'python-jsonschema' 'python-requests' 'python-dateutil')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-pymisp() {
  depends=('python2' 'python2-jsonschema' 'python2-requests' 'python2-dateutil')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python2 setup.py install -O1 --root="${pkgdir}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
