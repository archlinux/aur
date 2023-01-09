# Maintainer: Gerard Ribugent <ribugent at gmail dot com>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=python-databricks-cli
_pkgname=databricks-cli
pkgver=0.17.4
pkgrel=1
pkgdesc='Command Line Interface for Databricks'
arch=('any')
url='https://github.com/databricks/databricks-cli'
license=('Apache')
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
sha512sums=('3193d020bf0f76ca3d6f7a296f7b0245f2db723a84888abd74d9581516dd2b66a8dd056917bef0737bfc99679e64b74aa98489572d27c8992c1ce14f03fe58b6')


build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
