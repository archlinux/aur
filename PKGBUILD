# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-databricks-cli
pkgver=0.9.1
pkgrel=1
pkgdesc='open source tool which provides an easy to use interface to the
Databricks platform'
arch=('x86_64')
url='https://github.com/databricks/databricks-cli'
license=('Apache-2.0')
depends=('python' 'python-click' 'python-requests' 'python-tabulate'
    'python-six' 'python-libconfigparser')
optdepends=()
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/databricks/databricks-cli/archive/$pkgver.tar.gz")
sha256sums=('6b7748da9595b818618ce3810647f900304219122114472e6653c4ffcd302537')

_pkgname=databricks-cli

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
