# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-botorch
pkgver=0.4.0
pkgrel=1
pkgdesc='Bayesian Optimization in PyTorch'
arch=('x86_64')
url='https://botorch.org'
license=('MIT')
depends=('python' 'python-pytorch' 'python-gpytorch' 'python-scipy')
optdepends=()
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/pytorch/botorch/archive/v$pkgver.tar.gz")
sha256sums=('0a59d44f62e5cb315d6727677a2c7e2420375b73db189d416d723bdb7e7e5a5b')

_pkgname=botorch

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
