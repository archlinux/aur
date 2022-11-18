# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=pytorch-msssim
pkgname=python-$_pkgname
pkgver=0.2.1
pkgrel=1
pkgdesc="Fast and differentiable MS-SSIM and SSIM for pytorch"
arch=(any)
url=https://github.com/VainF/pytorch-msssim
depends=(python-pytorch)
makedepends=(python-installer)
license=(MIT)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=(f98f75efebe71bc221b4a6dd1a4616a153a1edb74a7bd955f0d0a9280480a108)

package() {
  cd "$srcdir" || return 1
  python -m installer --destdir="$pkgdir" ./*.whl || return 1
}
