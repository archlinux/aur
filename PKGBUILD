# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-torch-scatter
pkgver=2.1.0
pkgrel=1
pkgdesc='PyTorch Extension Library of Optimized Scatter Operations'
arch=('x86_64')
url='https://pytorch-scatter.readthedocs.io'
license=('MIT')
depends=('python')
makedepends=('python' 'python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/rusty1s/pytorch_scatter/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c587ddf7ffaf8e4ddc31d8016d7f445d5896ce491209574800166a9f85c29377')

_pkgname=pytorch_scatter

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
