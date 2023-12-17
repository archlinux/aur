# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-torch-scatter
pkgver=2.1.2
pkgrel=1
pkgdesc='PyTorch Extension Library of Optimized Scatter Operations'
arch=('x86_64')
url='https://pytorch-scatter.readthedocs.io'
license=('MIT')
depends=('python')
makedepends=('python' 'python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rusty1s/pytorch_scatter/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6f375dbc9cfe03f330aa29ea553e9c7432e9b040d039b041f08bf05df1a8bf37')

_pkgname=pytorch_scatter

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
