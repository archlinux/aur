# Maintainer: Winux <winux@winux.it

pkgname=python-pymatting
pkgver=1.1.15
_src_folder=${pkgname#python-}-$pkgver
pkgrel=1
pkgdesc="A Python library for alpha matting"
arch=('any')
url="https://github.com/pymatting/pymatting"
license=('MIT')
depends=('python' 'python-numpy' 'python-pillow' 'python-numba' 'python-scipy')
makedepends=('python-setuptools' 'python-build' 'python-installer')
source=("https://pypi.io/packages/source/${_src_folder::1}/${pkgname#python-}/${_src_folder}.tar.gz")
sha256sums=('67cbadd68d04696357461ad1861bcb3c2adc9ec5fcd38d524db606addabe745a')

build() {
    cd "$srcdir/$_src_folder"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_src_folder"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
