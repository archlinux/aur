# Maintainer: Gerard Ribugent <ribugent at gmail dot com>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=python-databricks-cli
_pkgname=databricks-cli
pkgver=0.17.5
pkgrel=1
pkgdesc='Command Line Interface for Databricks'
arch=('any')
url='https://github.com/databricks/databricks-cli'
license=('Apache')
depends=(
  'python>3.6'
  'python-click>=7.0'
  'python-pyjwt>=1.7.0'
  'python-oauthlib>=3.1.0'
  'python-requests>=2.17.3'
  'python-tabulate>=0.7.7'
  'python-six>=1.10.0'
)
makedepends=(python-build python-installer python-wheel)
source=("$pkgname-$pkgver.tar.gz::https://github.com/databricks/databricks-cli/archive/$pkgver.tar.gz")
sha512sums=('e7b87bd47dbcb6b66cae4ca2be9b3f920b17b25726fca8b86e5ad059f05c7ed669446fd6acef413d4fdf229280ad23ffa45f8a57a3a47ef51c6d493e581b68ac')


build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
