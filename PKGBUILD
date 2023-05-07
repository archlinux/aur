# Maintainer: Thibaud Kehler <thibaud dot kehler at gmx dot net>
# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-unicrypto
_pkgname=unicrypto
pkgver=0.0.8
pkgrel=2
pkgdesc="Unified interface for cryptographic libraries."
url="https://github.com/skelsec/unicrypto"
arch=('any')
license=('MIT')
depends=('python' 'python-pycryptodomex')
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('0487f9dd9009c326ee9531a79412ae18ad673425a1c800d64947b96fdeb04cdf')

build() {
  cd ${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pkgname}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
