# Maintainer: kpcyrd <git@rxv.cc>

pkgname=python-sepaxml
pkgver=2.6.1
pkgrel=1
pkgdesc="SEPA Direct Debit XML generation in python"
arch=(any)
url="https://github.com/raphaelm/python-sepaxml"
license=('MIT')
depends=('python' 'python-lxml' 'python-text-unidecode' 'python-xmlschema')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/raphaelm/python-sepaxml/archive/${pkgver}.tar.gz)
sha512sums=('fef5ba7116fb2c9581213f9eb0b3cf7deda8683441b0da95fbecbe6cf174d2cfdc3d2b58031156693500bde809d0f343ee947a4328ad6891a1cb7f6eedb36b3a')
b2sums=('e2f8794a24d4add0e42b43fb8a1269d21676769870c4dc3e87ebdb26aca0aa76541cefa602b5b606efe993671fb13344f98d7af5b7c629b5a9ec26b7293641be')

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
