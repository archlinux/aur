# Maintainer: Will Handley <wh260@cam.ac.uk>

# NVIDIA's CuTe DSL is published only as wheels; this is the pure-Python
# front end (the `cutlass` package on sys.path once nvidia-cutlass-dsl's
# path file is installed).
pkgname=python-nvidia-cutlass-dsl-libs-core
_pypi=nvidia_cutlass_dsl_libs_core
pkgver=4.8.0
pkgrel=1
pkgdesc='NVIDIA CuTe DSL: Python front end'
arch=('any')
url='https://pypi.org/project/nvidia-cutlass-dsl-libs-core/'
license=('LicenseRef-NVIDIA-Software-License-Agreement')
depends=('python' 'python-cuda' 'python-numpy' 'python-protobuf' 'python-typing_extensions')
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/85/66/d05f0ae372b80fc757e59d5211d93483c6ff721f574cb68cad84ceb87157/${_pypi}-${pkgver}-py3-none-any.whl")
noextract=("${source[0]##*/}")
sha256sums=('b32716d2ed10c185cdbbb6b5c6fca26a3113a60e6e2fe4e2f0cb15966422b621')

package() {
  python -m installer --destdir="$pkgdir" "$srcdir/${source[0]##*/}"
  install -Dm644 "$(find "$pkgdir" -path "*/${_pypi}-${pkgver}.dist-info/licenses/LICENSE")" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
