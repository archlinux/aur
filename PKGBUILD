# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=python-tilelang
_pkgname=tilelang
pkgver=0.1.11
pkgrel=1
pkgdesc='Tile-level domain-specific language for high-performance GPU/CPU kernels (binary wheel)'
arch=('x86_64')
url='https://github.com/tile-ai/tilelang'
license=('Apache-2.0')
depends=(
  'python>=3.9'
  'python-pytorch'
  'python-tvm-ffi'
  'python-numpy'
  'python-z3-solver'
  'python-cloudpickle'
  'python-ml-dtypes'
  'python-psutil'
  'python-tqdm'
  'cuda'
)
makedepends=('python-installer')
options=('!strip')

_wheel="${_pkgname}-${pkgver}-cp38-abi3-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl"
source=("https://files.pythonhosted.org/packages/b5/0e/ed59fb66606b6e51349793d9db209d01a41487008bd6d4a984249d70eb4b/${_wheel}")
sha256sums=('90d78f093d2bd46660633133982cd715cf9b7d0c379d463f136748efcfa55a9c')
noextract=("${_wheel}")

package() {
  python -m installer --destdir="${pkgdir}" "${srcdir}/${_wheel}"
}
