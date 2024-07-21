# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: zarra <zarraxx@gmail.com>
pkgname=py++
pkgver=1.8.6
pkgrel=1
pkgdesc="Py++ - Boost.Python code generator"
arch=('i686' 'x86_64')
url="https://pyplusplus.readthedocs.io/en/latest/"
license=('Boost Software License')
depends=('python' 'python-pygccxml' 'castxml')
makedepends=('python' 'python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
_pkgname=pyplusplus
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ompl/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('466b1de2c23bf8192c986a6fa5a9e798d4222d9b7a9d196a7a1fa97374205b53')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
