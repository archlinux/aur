# Maintainer: dan <dan@digitalprivacy.diy>

pkgname=python-mjolnir-synapse_antispam
_pkgname=mjolnir
pkgver=1.8.3
pkgrel=1
pkgdesc="Mjolnir antispam module for matrix-synapse."
arch=('any')
url="https://github.com/matrix-org/mjolnir/tree/main/synapse_antispam"
license=('Apache-2.0')

depends=(
  'matrix-synapse'
  'mjolnir'
  )
makedepends=('python-setuptools')

source=("https://github.com/matrix-org/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0e134ab1339b666629718a81d923410f3af31559afbe4d6dc8f895aba4ef5192')

build() {
  cd "${_pkgname}-${pkgver}/synapse_antispam"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}/synapse_antispam"
  python setup.py install --root="$pkgdir" --optimize=1
}
