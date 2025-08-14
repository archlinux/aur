# Maintainer: Exorcism
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: zarra <zarraxx@gmail.com>
pkgname=py++
pkgver=1.8.7
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
sha256sums=('e9959d0e80508bf3e86871661bf23e43e538aae21ad0471b594dd2e994baaf21')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
