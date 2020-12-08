# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-botorch
pkgver=0.3.3
pkgrel=1
pkgdesc='Bayesian Optimization in PyTorch'
arch=('x86_64')
url='https://botorch.org'
license=('MIT')
depends=('python' 'python-pytorch' 'python-gpytorch' 'python-scipy')
optdepends=()
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/pytorch/botorch/archive/v$pkgver.tar.gz")
sha256sums=('218e9026a9fdf6db876bfa9b53706cfd12f70ca54d8ea6e12fe6f38db669dad2')

_pkgname=botorch

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
