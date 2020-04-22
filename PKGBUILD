# Maintainer: Alexander Bruegmann <mail[at]abruegmann[dot]eu>
pkgname=('python-requests-pkcs12')
_pyname=requests_pkcs12
depends=('python-requests' 'python-pyopenssl')
makedepends=('python-setuptools')
pkgver=1.7
pkgrel=1
pkgdesc='This library adds PKCS#12 support to the Python requests library.'
arch=('any')
url="https://github.com/m-click/requests_pkcs12/"
license=('ISC')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/m-click/requests_pkcs12/archive/${pkgver}.tar.gz")
sha512sums=('69a12a15b3f851614d8672ad5b87d72abee4156453b21013f809288005342ac3cf84d2bbb07e116ff16ad400627bbacbb5bd340d01e87389b9ee5fef7d2b35a0')

build() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py test
}


package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

