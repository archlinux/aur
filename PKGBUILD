# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-botorch
pkgver=0.2.2
pkgrel=1
pkgdesc='Bayesian Optimization in PyTorch'
arch=('x86_64')
url='https://botorch.org'
license=('MIT')
depends=('python' 'python-pytorch' 'python-gpytorch' 'scipy')
optdepends=()
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/pytorch/botorch/archive/v$pkgver.tar.gz")
sha256sums=('8e0204d4fc11b5f4e11c6816f5ad06292d401f7f93c67e0300a9eb2c8c0ec228')

_pkgname=botorch

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
