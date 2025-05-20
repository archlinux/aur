# Maintainer: Benoit Brummer (Trougnouf) <trougnouf@gmail.com>

pkgname=('python-torchvision-rocm-bin')
pkgdesc="Datasets, transforms, and models specific to computer vision (binary release)"
pkgver=0.22.0
pkgrel=1
_rocmver=6.3
_pyver=313
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
source=("https://download.pytorch.org/whl/rocm${_rocmver}/torchvision-${pkgver}%2Brocm${_rocmver}-cp${_pyver}-cp${_pyver}-linux_x86_64.whl")
sha256sums=('a8a4bf1cd38ceccb1324b36c6fd748c68806b5f00b8c4c01b924031f24508355')


package() {
    # Define where to install the package
    cd "${srcdir}"

    # Install the wheel file
    python -m pip install --no-deps --root="${pkgdir}" "torchvision-${pkgver}%2Brocm${_rocmver}-cp${_pyver}-cp${_pyver}-linux_x86_64.whl" --break-system-packages --no-warn-script-location --ignore-installed
}
