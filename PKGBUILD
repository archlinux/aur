# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=python-cdifflib
_pyname=cdifflib
pkgver=1.2.9
pkgrel=1
pkgdesc='C-extension drop-in replacement for stdlib difflib (faster diff)'
arch=('x86_64')
url='https://github.com/mduggan/cdifflib'
license=('BSD-3-Clause')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'gcc')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
sha256sums=('6286da08f72b7ddb5b40145dcb8f214ad913a86d72b1f62cc8d6cf7a92029590')

build() {
    cd "$_pyname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pyname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
