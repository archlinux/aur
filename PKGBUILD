pkgname=python-facebook-sdk
pkgver=3.1.0
pkgrel=1
pkgdesc="Python SDK for Facebook's Graph API"
arch=('any')
url='https://github.com/mobolic/facebook-sdk'
license=('Apache-2.0')

depends=(
  'python'
  'python-requests'
)

makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

source=("https://files.pythonhosted.org/packages/source/f/facebook-sdk/facebook-sdk-${pkgver}.tar.gz")
sha256sums=('cabcd2e69ea3d9f042919c99b353df7aa1e2be86d040121f6e9f5e63c1cf0f8d')

build() {
  cd "facebook-sdk-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "facebook-sdk-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
