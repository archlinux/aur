# Maintainer: Benoit Brummer (Trougnouf) <trougnouf@gmail.com>

_name='h3-py'
pkgname=('python-h3')
pkgdesc="Hexagonal Hierarchical Geospatial Indexing System in Python"
pkgver=3.7.7
pkgrel=1
url="https://github.com/uber/${_name}"
license=('Apache')
arch=('any')
depends=('python' 'cython')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-scikit-build' 'cmake' 'flake8' 'python-cmake-build-extension' 'python-setuptools')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('c6b42cfc785d4c43830be52be99bafedafcaee7cb8dd059e8448ce558516008a')

prepare() {
    cd "${srcdir}/${_name}"
    git submodule update --init --recursive
}

build() {
    cd "${srcdir}/${_name}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}"
    python setup.py install --root="$pkgdir" --optimize=1
}
