# Maintainer: kpcyrd <git@rxv.cc>

pkgname="python-sepaxml"
pkgver="2.1.0"
pkgrel=1
pkgdesc="SEPA Direct Debit XML generation in python"
arch=(any)
url="https://github.com/raphaelm/python-sepaxml"
license=('MIT')
depends=('python-lxml' 'python-text-unidecode' 'python-xmlschema')
makedepends=('python-setuptools' 'python-pytest')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/raphaelm/python-sepaxml/archive/${pkgver}.tar.gz)
sha512sums=('8ce9d29bb75b111df14b2adb5dffc4c92b90beee6426e9aae166d82cd4f1bc9ba8cb84d4e65c9b51c3fac1fc62b5b7f25f3aa1b2fbda4566933bb297ed2d40a6')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${pkgname}-${pkgver}"
  PYTHONPATH=. pytest
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
