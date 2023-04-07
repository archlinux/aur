# Maintainer: kpcyrd <git@rxv.cc>

pkgname=python-sepaxml
pkgver=2.6.0
pkgrel=2
pkgdesc="SEPA Direct Debit XML generation in python"
arch=(any)
url="https://github.com/raphaelm/python-sepaxml"
license=('MIT')
depends=('python' 'python-lxml' 'python-text-unidecode' 'python-xmlschema')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/raphaelm/python-sepaxml/archive/${pkgver}.tar.gz)
sha512sums=('6a04955a74405a73c07ef0bbb253451b242106517d57a69e9e362d4236567f50f469d1a4156cd31732a081d79cefe030b53821b2c9d3a15d6afb1bcd36419995')
b2sums=('a0e530cfc5bff6ad364484bc4c78009fc857bb32c761bdbe0e41120cbe1e68c8b3af967900c13682a39d05630464521c57433e89745789e1a3965902fe7cc4f6')

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
