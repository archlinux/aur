# Maintainer: Yakov Till <yakov.till@gmail.com>

_name=solc_select
pkgname=python-solc-select
pkgver=1.2.0
pkgrel=1
pkgdesc='Manage multiple Solidity compiler versions'
arch=(any)
url='https://github.com/crytic/solc-select'
license=('AGPL-3.0-only')
depends=(
  'python>=3.8'
  python-packaging
  python-pycryptodome
  python-requests
)
makedepends=(python-build python-installer python-setuptools python-wheel)
conflicts=(solidity)
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/s/solc-select/${_name}-${pkgver}.tar.gz")
sha256sums=('ad0a7afcae05061ce5e7632950b1fa0193ba9eaf05e4956f86effee024c6fb07')

build() {
  cd "$srcdir/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
