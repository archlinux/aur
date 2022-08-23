# Maintainer: Your Name <youremail@domain.com>

pkgname=python-material-color-utilities
_name=material-color-utilities-python
pkgver=0.1.4
pkgrel=2
pkgdesc="Python port of material-color-utilities used for Material You colors"
arch=('any')
url="https://github.com/avanishsubbiah/material-color-utilities-python"
license=('Apache')
depends=('python-pillow' 'python-regex')
makedepends=('python-build' 'python-installer' 'python-poetry' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('c7d06e83986fc6af771d11acc047333ba1a6ce94d295d9776740ebbc54d8dabbcad30cb2c0ed1e28b30cc6be7aa9aa2ee838a9c450c0a47fbb577a2c934dd144')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
