# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=python-kaldialign
_pyname=kaldialign
pkgver=0.9.3
pkgrel=1
pkgdesc='Python wrappers for Kaldi sequence alignment + edit-distance utilities'
arch=('x86_64')
url='https://github.com/pzelasko/kaldialign'
license=('Apache-2.0')
depends=('python')
makedepends=(
    'cmake'
    'pybind11'
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("$_pyname-$pkgver.tar.gz::https://github.com/pzelasko/$_pyname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a72309efddfd78e3f4f9a627534512b1a375fc39463c42f7df652161aab0f678')

build() {
    cd "$_pyname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pyname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
