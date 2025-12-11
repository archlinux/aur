# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=pytorch-msssim
pkgname=python-$_pkgname
pkgver=1.0.0
pkgrel=1
pkgdesc="Fast and differentiable MS-SSIM and SSIM for pytorch"
arch=(any)
url=https://github.com/VainF/pytorch-msssim
depends=(python-pytorch)
makedepends=(python-installer)
license=(MIT)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('0b4b7bbf7035fe9dc8084244237aac13b1f104852c45b63a7e9fab4363bede54')

package() {
  cd "$srcdir" || return 1
  python -m installer --destdir="$pkgdir" ./*.whl || return 1
}
