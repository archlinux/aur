# Maintainer: dan <dan@digitalprivacy.diy>

pkgname=python-mjolnir-synapse_antispam
_pkgname=mjolnir
pkgver=1.9.2
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
sha256sums=('b7c58e8cf50a9cde2bec86df9b57831a0810fe37cf1dac7988a9947e274a520b')

build() {
  cd "${_pkgname}-${pkgver}/synapse_antispam"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}/synapse_antispam"
  python setup.py install --root="$pkgdir" --optimize=1
}
