# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-torch-sparse
pkgver=0.6.17
pkgrel=1
pkgdesc='PyTorch Extension Library of Optimized Autograd Sparse Matrix
Operations'
arch=('x86_64')
url='https://github.com/rusty1s/pytorch_sparse'
license=('MIT')
depends=('python' 'python-scipy')
makedepends=('python' 'python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/rusty1s/pytorch_sparse/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c964a70ed978bff65009250eb12fae96317c60c9a04d7d1b07f0beee8b4b9c22')

_pkgname=pytorch_sparse

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
