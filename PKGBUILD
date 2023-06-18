# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-vmaf
pkgver=2.3.1
pkgrel=1
pkgdesc='Perceptual video quality assessment algorithm based on multi-method fusion (python implementation)'
arch=('x86_64')
url='https://github.com/netflix/vmaf/'
license=('BSD')
depends=(
    # official repositories:
        'cython' 'python' 'python-dill' 'python-numpy' 'python-scipy' 'python-matplotlib'
        'python-pandas' 'python-scikit-learn' 'python-h5py'
    # AUR:
        'python-scikit-image' 'python-sureal'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://github.com/Netflix/vmaf/archive/v${pkgver}/vmaf-${pkgver}.tar.gz")
sha256sums=('8d60b1ddab043ada25ff11ced821da6e0c37fd7730dd81c24f1fc12be7293ef2')

build() {
    cd "vmaf-${pkgver}/python"
    python -m build --wheel --no-isolation
}

package() {
    python -m installer --destdir="$pkgdir" "vmaf-${pkgver}/python/dist"/*.whl
}
