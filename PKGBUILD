# Maintainer: Alexander Bruegmann <mail[at]abruegmann[dot]eu>
pkgbase=python-tenableio
_pyname=Tenable.io-SDK-for-Python-v
pkgname=('python-tenableio' 'python2-tenableio')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
pkgver=1.8.0
pkgrel=1
pkgdesc="Python library to easily integrate with the tenable.io API"
arch=('any')
url="https://github.com/tenable/Tenable.io-SDK-for-Python/"
license=('MIT')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/tenable/Tenable.io-SDK-for-Python/archive/v.${pkgver}.tar.gz")
sha512sums=('56768df152ae9bbab97e68e499fca7f3329e03f08a50105021bad217bce646099287f7dd1fb24209bcf48651932fe59d496a6c2d827766956ec12666e3f7a018')

package_python-tenableio() {
  depends=('python' 'python-requests' 'python-six')
  cd "${srcdir}/${_pyname}.${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-tenableio() {
  depends=('python2' 'python2-requests' 'python2-six')
  cd "${srcdir}/${_pyname}.${pkgver}"
  python2 setup.py install -O1 --root="${pkgdir}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
