# Maintainer: Your Name <youremail@domain.com>

pkgname=python-material-color-utilities
_name=material-color-utilities-python
pkgver=0.1.3
pkgrel=1
pkgdesc="Python port of material-color-utilities used for Material You colors"
arch=('any')
url="https://github.com/avanishsubbiah/material-color-utilities-python"
license=('Apache')
depends=('python-pillow' 'python-regex')
makedepends=('python-build' 'python-installer' 'python-poetry' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('2cd30eb7cc3cc733bf9eac6b8bff75f0976960d38351861a1905d96992113d36a04413df5c16f9167d65966dbbe7bbd9285871dcb36a1765d62ff4cc6a7c9ccc')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
