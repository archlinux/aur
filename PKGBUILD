# Maintainer: kpcyrd <git@rxv.cc>

pkgname=python-sepaxml
pkgver=2.5.0
pkgrel=1
pkgdesc="SEPA Direct Debit XML generation in python"
arch=(any)
url="https://github.com/raphaelm/python-sepaxml"
license=('MIT')
depends=('python' 'python-lxml' 'python-text-unidecode' 'python-xmlschema')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/raphaelm/python-sepaxml/archive/${pkgver}.tar.gz)
sha512sums=('60cb002eb16c2375f97e7aa8df5bfc0f9d9ed20a7daafbd5c9fdc104f236fee87a46ba35dc96ae613e0d9a881181111cec12e7324f54dd2cf64685ded45ebefe')
b2sums=('c3acf87a80af242c5132a61723a5d3dcc79df2a2ee732926681a318f36cb16beb7159e6b524b1f99face8b47fa23814a75f8a9a16fbf366afb4638c77c58c259')

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
