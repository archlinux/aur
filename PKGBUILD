# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-databricks-cli
pkgver=0.17.1
pkgrel=1
pkgdesc='open source tool which provides an easy to use interface to the
Databricks platform'
arch=('x86_64')
url='https://github.com/databricks/databricks-cli'
license=('Apache-2.0')
depends=('python' 'python-click' 'python-pyjwt' 'python-oauthlib'
         'python-requests' 'python-tabulate' 'python-six')
optdepends=()
makedepends=('python' 'python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/databricks/databricks-cli/archive/$pkgver.tar.gz")
sha256sums=('74c63ce6ef42a86787a3dbe1c0a434f6f6ec93a4f205f68f27164d4effc99212')

_pkgname=databricks-cli

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
