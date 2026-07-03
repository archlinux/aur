# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=python-kaldialign
_pyname=kaldialign
pkgver=0.12.0
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
sha256sums=('15491654690ce5fb3d938d0086771bda9ae382e29c6fcda5e76905d9cab09d2f')

build() {
    cd "$_pyname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pyname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
