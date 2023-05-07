# Maintainer: Thibaud Kehler <thibaud dot kehler at gmx dot net>
# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-unicrypto
_pkgname=unicrypto
pkgver=0.0.10
pkgrel=1
pkgdesc="Unified interface for cryptographic libraries."
url="https://github.com/skelsec/unicrypto"
arch=('any')
license=('MIT')
depends=('python' 'python-pycryptodomex')
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
source=("https://github.com/skelsec/${_pkgname}/archive/refs/tags/${pkgver}.zip") 
sha256sums=('1778e9c41ff0c372da816f6d9592991faf5ae331a2e9a2b5e389c58844a4974c')

build() {
  cd ${_pkgname}-${pkgver}
  rm -rf tests
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pkgname}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
