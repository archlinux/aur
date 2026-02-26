# Maintainer: tblFlip <root@tblflip.de>
# Contributor: dan <dan@digitalprivacy.diy>

pkgname=python-mjolnir-synapse_antispam
_pkgname=mjolnir
pkgver=1.12.0
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

sha256sums=(
	"c2e600d201b86cb92674c02f8b5765c0c2fde9eea905b8a7df4a693042506028"
)

build() {
  cd "${_pkgname}-${pkgver}/synapse_antispam"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}/synapse_antispam"
  python setup.py install --root="$pkgdir" --optimize=1
}
