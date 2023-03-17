# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-torch-scatter
pkgver=2.1.1
pkgrel=1
pkgdesc='PyTorch Extension Library of Optimized Scatter Operations'
arch=('x86_64')
url='https://pytorch-scatter.readthedocs.io'
license=('MIT')
depends=('python')
makedepends=('python' 'python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/rusty1s/pytorch_scatter/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ea4f4ac4210a983d878df29e82190f60a7e6e9a791adbe0c0d635040e6256c4d')

_pkgname=pytorch_scatter

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
