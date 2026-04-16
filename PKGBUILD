# Maintainer: Benoit Brummer (Trougnouf) <trougnouf@gmail.com>

pkgname=('python-torchvision-rocm-bin')
pkgdesc="Datasets, transforms, and models specific to computer vision (binary release)"
pkgver=0.26.0
pkgrel=1
_rocmver=7.2
_pyver=314
url="https://pytorch.org/vision"
license=('BSD')
arch=('x86_64')
depends=(
  numactl
  python-numpy
  python-pillow
  python-requests
  python-scipy
  python-sympy
  python-pytorch-rocm
)

makedepends=('python-setuptools' 'python-wheel')
conflicts=(python-torchvision)
provides=("python-torchvision=${pkgver}" "python-torchvision-rocm=${pkgver}")
source=("https://download.pytorch.org/whl/rocm${_rocmver}/torchvision-${pkgver}%2Brocm${_rocmver}-cp${_pyver}-cp${_pyver}-manylinux_2_28_x86_64.whl")
sha256sums=('6e7337224df2c9391cd19f10cd4193cf0c06ccb929cf62c13da39d359ec8b3e9')


package() {
    # Define where to install the package
    cd "${srcdir}"

    # Install the wheel file
    python -m pip install --no-deps --root="${pkgdir}" "torchvision-${pkgver}%2Brocm${_rocmver}-cp${_pyver}-cp${_pyver}-manylinux_2_28_x86_64.whl" --break-system-packages --no-warn-script-location --ignore-installed
}
