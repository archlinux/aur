# Maintainer: Winux <winux@winux.it

pkgname=python-pymatting
_pkgname=pymatting
pkgver=1.1.10
pkgrel=2
pkgdesc="A Python library for alpha matting"
arch=('any')
url="https://github.com/pymatting/pymatting"
license=('MIT')
depends=('python' 'python-numpy' 'python-pillow' 'python-numba' 'python-scipy')
makedepends=('python-setuptools' 'python-build' 'python-installer')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('68b5f4a39f1b055d4f8c67ae4e57e06b45c6300237b04d7058aaf5bcf09b3348')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
