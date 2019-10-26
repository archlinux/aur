# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-databricks-cli
pkgver=0.9.0
pkgrel=1
pkgdesc='open source tool which provides an easy to use interface to the
Databricks platform'
arch=('x86_64')
url='https://github.com/databricks/databricks-cli'
license=('Apache-2.0')
depends=('python' 'python-click' 'python-requests' 'python-tabulate'
    'python-six')
optdepends=()
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/databricks/databricks-cli/archive/$pkgver.tar.gz")
sha256sums=('de284efd6ba62a4b68612988b4a5739939b0d71a1787b29bdc4c410c8b4a01b8')

_pkgname=databricks-cli

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
