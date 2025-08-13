# Maintainer: Winux <winux@winux.it

pkgname=python-pymatting
_pkgname=pymatting
pkgver=1.1.13
pkgrel=1
pkgdesc="A Python library for alpha matting"
arch=('any')
url="https://github.com/pymatting/pymatting"
license=('MIT')
depends=('python' 'python-numpy' 'python-pillow' 'python-numba' 'python-scipy')
makedepends=('python-setuptools' 'python-build' 'python-installer')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d19e6a25f08e24b1f857bf161c8019dfb02b8d7d990ea8cfd43aedc826ac47e5')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
