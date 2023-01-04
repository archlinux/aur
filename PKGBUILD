# Maintainer: Henry-ZHR <henry-zhr@qq.com>
pkgname=python-torchsde
_name=${pkgname#python-}
pkgver=0.2.4
pkgrel=1
pkgdesc="Differentiable SDE solvers with GPU support and efficient sensitivity analysis"
arch=('any')
url="https://github.com/google-research/torchsde"
license=('Apache')
depends=('python-boltons'
         'python-numpy'
         'python-scipy'
         'python-pytorch'
         'python-trampoline')
makedepends=('python-build'
             'python-installer'
             'python-wheel')
source=("${_name}-${pkgver}::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('07ff7271f417acee0178a8f1f6780dd59b2aed57cb5350c2c0c0fbfdb82f0989d88faa53eb59ccb284a821ec3629dc24a8cfc935dbe973fd1186f2daf84b2916')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
