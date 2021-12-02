# Maintainer: kpcyrd <git@rxv.cc>

pkgname=python-sepaxml
pkgver=2.4.1
pkgrel=3
pkgdesc="SEPA Direct Debit XML generation in python"
arch=(any)
url="https://github.com/raphaelm/python-sepaxml"
license=('MIT')
depends=('python' 'python-lxml' 'python-text-unidecode' 'python-xmlschema')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/raphaelm/python-sepaxml/archive/${pkgver}.tar.gz)
sha512sums=('cee507bced91a7b201f07d3c06f2be0a9470d79ca1a816fec09feb78ab6d39bf31cdc7f58d24d434c8bc121d874547b308651eb1f42dba751e918bf5c7a50cfe')
b2sums=('8e9b868dc596af06b655db3478f2470eeec98100ed84a4150b20252fe7cd95dbd34e413d3debcb723e259109cef00a037aef3522d215d05a07991698f17134e7')

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
