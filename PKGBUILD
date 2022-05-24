#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=python-taichi
_name=${pkgname#python-}
_py=cp310
pkgver=1.0.2
pkgrel=1
pkgdesc='Productive & portable programming language for high-performance, sparse & differentiable computing on CPUs & GPUs'
url='https://github.com/taichi-dev/taichi'
arch=('x86_64')
license=('MIT')
depends=(
  'python'
  'python-astor'
  'python-numpy'
  'pybind11'
  'python-pillow'
  'python-dill'
  'ncurses5-compat-libs'
  'libx11'
)
optdepends=(
  'python-autograd'
  'python-sourceinspect'
  'python-astpretty'
  'python-colorama'
  'python-gitpython'
  'yapf'
  'cuda')
makedepends=(
  'python-build'
  'python-installer')
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name//-/_}-$pkgver-$_py-$_py-manylinux2014_x86_64.whl")
b2sums=('1c1252aa5bb68ec01699cc8ab6e57cba26989ac1437cd62b0e7c08a5b9e631a49d5c1f6e1b3d63e15d82e3e30898d6dd52f218849fde4995abddeda244f58813')

package() {
  python -m installer --destdir="$pkgdir" ./*.whl

  install -Dm644 "$srcdir/$_name-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
