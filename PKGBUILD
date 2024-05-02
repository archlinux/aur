# Maintainer: Benoit Brummer (Trougnouf) <trougnouf@gmail.com>

pkgname=('python-torchvision-rocm-bin')
pkgdesc="Datasets, transforms, and models specific to computer vision (binary release)"
pkgver=0.18.0
pkgrel=3
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
source=("https://download.pytorch.org/whl/rocm6.0/torchvision-${pkgver}%2Brocm6.0-cp312-cp312-linux_x86_64.whl")
sha256sums=('8180284a250e63c8214cea7eb19e22a79f44c5fcb5f3ba815620ac923e8aab2f')


package() {
    # Define where to install the package
    cd "${srcdir}"

    # Install the wheel file
    python -m pip install --no-deps --root="${pkgdir}" torchvision-${pkgver}%2Brocm6.0-cp312-cp312-linux_x86_64.whl --break-system-packages --no-warn-script-location --ignore-installed
}
