# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-botorch
pkgver=0.2.1
pkgrel=1
pkgdesc='Bayesian Optimization in PyTorch'
arch=('x86_64')
url='https://botorch.org'
license=('MIT')
depends=('python' 'python-pytorch' 'python-gpytorch' 'scipy')
optdepends=()
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/pytorch/botorch/archive/v$pkgver.tar.gz")
sha256sums=('5388fd9802857813df55bdbc02fc63e6014f387efa61734dee27cf48d563f116')

_pkgname=botorch

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
