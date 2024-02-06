# Maintainer: Pravin Ramana <pravinramana25 at protonmail dot ch>

pkgname=python-gpuctypes
_name=${pkgname#python-}
pkgver=0.3.0
pkgrel=1
pkgdesc="ctypes wrappers for HIP, CUDA, and OpenCL"
arch=('any')
url="https://github.com/tinygrad/gpuctypes"
license=('MIT')
depends=('python>=3.8')
optdepends=('cuda' 'hip-runtime-amd' 'opencl-driver')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('62cbf72df8a57e23509633ee1e7e4c719a31962b2e5fd0e48c6330e84583b717')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

