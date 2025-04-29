# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-xformers-bin
_pkgname=xformers
_cp='cp312'
_cu='cu128'
pkgver=0.0.30
pkgrel=1
pkgdesc="Transformers building blocks, supporting a composable construction"
arch=('x86_64')
url='https://github.com/facebookresearch/xformers'
license=(BSD-3-Clause)
depends=(
  python
  python-pytorch
  python-numpy 
  python-sentencepiece 
  python-safetensors
)
optdepends=( 
  'cuda: cuda optimizations'
  'pytorch-cuda: cuda optimizations'
  'python-torchvision: torchvision usage'
  'python-transformers: transformers usage'
)
provides=(python-xformers)
conflicts=(python-xformers)
makedepends=(python-installer python-wheel)
sha256sums=('e2602a3f36c1d5c3aec7dc9f79050e3db5c1e94fc11ad929afbdb409c6d611d5')
source=("https://download.pytorch.org/whl/${_cu}/xformers-${pkgver}-${_cp}-${_cp}-manylinux_2_28_${CARCH}.whl")
package() {
  python -m installer --destdir="$pkgdir" *.whl
}
# vim:set ts=2 sw=2 et:
