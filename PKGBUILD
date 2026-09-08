# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=python-tilelang
_pkgname=tilelang
pkgver=0.1.14
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

_wheel="${_pkgname}-${pkgver}-cp39-abi3-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl"
source=("https://files.pythonhosted.org/packages/40/69/e69a18eaf239efaa1718922a26d0a4605a0525a2263d3224f506354c02ae/${_wheel}")
sha256sums=('fcc5d47ac1baeb7a8555ff5384af9ce9f3efef46dd926bc23d2c1cd425f68600')
noextract=("${_wheel}")

package() {
  python -m installer --destdir="${pkgdir}" "${srcdir}/${_wheel}"
}
