# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-gpytorch
pkgver=0.3.5
pkgrel=1
pkgdesc='A highly efficient and modular implementation of GPs, with GPU
acceleration. Implemented in PyTorch.'
arch=('x86_64')
url='https://gpytorch.ai'
license=('MIT')
depends=('python' 'python-pytorch')
optdepends=()
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/cornellius-gp/gpytorch/archive/v$pkgver.tar.gz")
sha256sums=('904eecd5c5d88fa98f95e34b3ee53f94706fc7d6c3adc164c4e90a007e72d41b')

_pkgname=gpytorch

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
