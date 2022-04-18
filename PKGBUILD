# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-databricks-cli
pkgver=0.16.6
pkgrel=1
pkgdesc='open source tool which provides an easy to use interface to the
Databricks platform'
arch=('x86_64')
url='https://github.com/databricks/databricks-cli'
license=('Apache-2.0')
depends=('python' 'python-click' 'python-requests' 'python-tabulate' 'python-six')
optdepends=()
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/databricks/databricks-cli/archive/$pkgver.tar.gz")
sha256sums=('269480349dacfcb7c3fff6644b0f07a88c6ffaefd46bd2a5290bc6e10905c73b')

_pkgname=databricks-cli

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
