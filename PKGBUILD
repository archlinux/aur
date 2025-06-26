# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-xformers-bin
_pkgname=xformers
_cp='cp39' #this is a multicompat ver
_cu='cu128'
_ab='abi3'
pkgver=0.0.31
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
  'python-pytorch-opt-cuda: cuda with AVX2 optimizations'
  'python-pytorch-cuda: cuda optimizations WITHOUT AVX2'
  'python-torchvision: torchvision usage'
  'python-transformers: transformers usage'
)
provides=(python-xformers)
conflicts=(python-xformers)
makedepends=(python-installer python-wheel)
sha256sums=('b2ea87e0651f46164cb3cd74face021bd1654229ca4f8c0baa03b8c477515c7a')
source=("https://download.pytorch.org/whl/${_cu}/xformers-${pkgver}-${_cp}-${_ab}-manylinux_2_28_${CARCH}.whl")
package() {
  python -m installer --destdir="$pkgdir" *.whl
}
# vim:set ts=2 sw=2 et:
