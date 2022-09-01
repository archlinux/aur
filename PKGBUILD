# Maintainer: Gerard Ribugent <ribugent at gmail dot com>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=python-databricks-cli
_pkgname=databricks-cli
pkgver=0.17.2
pkgrel=1
pkgdesc='Command Line Interface for Databricks'
arch=('any')
url='https://github.com/databricks/databricks-cli'
license=('Apache-2.0')
depends=(
  'python'
  'python-click>=7.0'
  'python-pyjwt>=1.7.0'
  'python-oauthlib>=3.1.0'
  'python-requests>=2.17.3'
  'python-tabulate>=0.7.7'
  'python-six>=1.10.0'
)
makedepends=(python-build python-installer python-wheel)
source=("$pkgname-$pkgver.tar.gz::https://github.com/databricks/databricks-cli/archive/$pkgver.tar.gz")
sha256sums=('9ac3eaebaf5bc174c8ad3aa0254602ed7067fc5b3d2c1f3cb14af2f277ae57b8')


build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
