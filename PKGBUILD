# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>

_name=dipy
pkgname=python-dipy
pkgver=1.9.0
pkgrel=1
pkgdesc="Diffusion MR imaging in Python"
arch=('x86_64')
url="https://dipy.org"
license=('BSD')
depends=(
    'python-h5py'
    'python-nibabel'
    'python-numpy'
    'python-packaging'
    'python-scipy'
    'python-tqdm'
)
makedepends=('python-setuptools' 'cython')
checkdepends=('python-pytest')
source=(
    "$_name-$pkgver.tar.gz::https://github.com/dipy/dipy/archive/${pkgver}.tar.gz"
)
sha256sums=('2760c3d1456dd3620c88836b2aa7d576e73bea10a28ccd795f1582bfaefb4ff1')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}


