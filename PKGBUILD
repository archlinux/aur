# Maintainer: Winux <winux@winux.it

pkgname=python-pymatting
pkgver=1.1.16
_src_folder=${pkgname#python-}-$pkgver
pkgrel=1
pkgdesc="A Python library for alpha matting"
arch=('any')
url="https://github.com/pymatting/pymatting"
license=('MIT')
depends=('python' 'python-numpy' 'python-pillow' 'python-numba' 'python-scipy')
makedepends=('python-setuptools' 'python-build' 'python-installer')
source=("https://pypi.io/packages/source/${_src_folder::1}/${pkgname#python-}/${_src_folder}.tar.gz")
sha256sums=('656e16f07c941b8792c8cd341b49791e74d1949ceae4d8c45fb4e10d3c6e7d77')

build() {
    cd "$srcdir/$_src_folder"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_src_folder"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
