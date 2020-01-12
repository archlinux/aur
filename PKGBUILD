# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-gpytorch
pkgver=1.0.0
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
sha256sums=('f61166fdeee7b0d900887a2b00c61fee70bc35fe28d873fcd6bcba3e833793f2')

_pkgname=gpytorch

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
