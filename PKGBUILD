# Maintainer: kpcyrd <git@rxv.cc>

pkgname="python-sepaxml"
pkgver="2.2.0"
pkgrel=4
pkgdesc="SEPA Direct Debit XML generation in python"
arch=(any)
url="https://github.com/raphaelm/python-sepaxml"
license=('MIT')
depends=('python' 'python-lxml' 'python-text-unidecode' 'python-xmlschema')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/raphaelm/python-sepaxml/archive/${pkgver}.tar.gz)
sha512sums=('d65e7845ef150e5c164d26fffa35c050629cb6337c493c84341c3208de0487a379f294f7bb8578438c641b4a81108bd8584051d90ead51ba4c443148ec4dd8e7')
b2sums=('1010531edadbba9b1e95266984dd3e64527a8164d3eda5232bfbf028d76030d231cf2c92245f04f3b0defa599890ab28f4386640932ef679099b173edc22e1dc')

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
  python setup.py install -O1 --root="${pkgdir}" --skip-build

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
