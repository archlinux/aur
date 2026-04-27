# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=python-tilelang
_pkgname=tilelang
pkgver=0.1.9
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
source=("https://files.pythonhosted.org/packages/f7/8a/1cbeee79d62abaa02441c2d00621554e41aa62dbf3b94a4feb3867184b01/${_wheel}")
sha256sums=('4bbccfe9035aed775ffafb6dc25a5994504b24e2c5d95d0f39643edfafa7bf12')
noextract=("${_wheel}")

package() {
  python -m installer --destdir="${pkgdir}" "${srcdir}/${_wheel}"
}
