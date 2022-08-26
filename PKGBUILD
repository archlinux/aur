# Maintainer: Your Name <youremail@domain.com>

pkgname=python-material-color-utilities
_name=material-color-utilities-python
pkgver=0.1.5
pkgrel=1
pkgdesc="Python port of material-color-utilities used for Material You colors"
arch=('any')
url="https://github.com/avanishsubbiah/material-color-utilities-python"
license=('Apache')
depends=('python-pillow' 'python-regex')
makedepends=('python-build' 'python-installer' 'python-poetry' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('cf444831fec962caae3a1871b8331dcdd055f186754631185140842e49e1dc5526c5aedc021d28cd5e192e6f593774abce34e4a2853049e9ded2cf3ca9b79e3f')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
