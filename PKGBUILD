# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: zarra <zarraxx@gmail.com>
pkgname=py++
pkgver=1.8.4
pkgrel=1
pkgdesc="Py++ - Boost.Python code generator"
arch=('i686' 'x86_64')
url="https://pyplusplus.readthedocs.io/en/latest/"
license=('Boost Software License')
depends=('python' 'python-pygccxml' 'castxml')
source=("https://github.com/ompl/pyplusplus/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('10379d3b2c78612d9097a6533b4da5ad91f91377022bb6f6052549579b4991ee')

build() {
  cd "$srcdir/pyplusplus-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/pyplusplus-${pkgver}"
  python setup.py install --prefix=/usr --root=$pkgdir
}
