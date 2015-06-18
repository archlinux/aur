# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgbase=python-tblib
pkgname=('python-tblib' 'python2-tblib')
_pyname=tblib
pkgver=1.0.1
pkgrel=1
pkgdesc="Python traceback fiddling library"
url="https://github.com/ionelmc/python-tblib"
arch=('any')
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-tox' 'python-six' 'python2-six')
source=(${pkgbase}-${pkgver}.tar.gz::https://pypi.python.org/packages/source/t/${_pyname}/${_pyname}-${pkgver}.tar.gz)
sha512sums=('5a26e96c7d0a89b463766e8b83a2f949a468a717295ae89c53496e0abbf1129598da0d2054a5d2d85710fb152302c9bbc06b2819f419fb5a5748c5dc3bbfe1ee')

check() {
  cd ${_pyname}-${pkgver}
  tox -e py -e py3
}

package_python-tblib() {
  depends=('python-six')

  cd ${_pyname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-tblib() {
  depends=('python2-six')

  cd ${_pyname}-${pkgver}
  python2 setup.py install -O1 --root="${pkgdir}" --prefix=/usr
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
