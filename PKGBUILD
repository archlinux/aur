# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-aqlm
_pkgname=${pkgname#python-}
pkgver=1.1.7
pkgrel=1
pkgdesc='Efficient quantized model inference with AQLM'
arch=('any')
url='https://github.com/Vahe1994/AQLM'
license=('MIT')
depends=(
    'python-accelerate'
    'python-pytorch'
    'python-scipy'
    'python-transformers'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=(
  'python-triton: JIT-compiled modules on GPU'
)
_wheel="aqlm-${pkgver}-py3-none-any.whl"
noextract=("${_wheel}")
source=(
  "${_wheel}::https://files.pythonhosted.org/packages/33/02/3f4caa19fa7150a00beceff0b8451e2e44728bb345166f89c320261d66a8/${_wheel}"
)
sha256sums=('cd965095f83240549a4bf93d314e92bd33165430aa4f22c9a78638dadc137a1e')

package() {
  python -m installer --compile-bytecode=1 --destdir=$pkgdir $_wheel
}
