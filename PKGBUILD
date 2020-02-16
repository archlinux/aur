# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-gpytorch-git
pkgver=r2694.bd9a8b27
pkgrel=1
pkgdesc='A highly efficient and modular implementation of GPs, with GPU
acceleration. Implemented in PyTorch.'
arch=('x86_64')
url='https://gpytorch.ai'
license=('MIT')
depends=('python' 'python-pytorch')
optdepends=()
makedepends=('python' 'python-setuptools')
provides=('python-gpytorch')
conflicts=('python-gpytorch')
_pkgname=gpytorch
source=("$_pkgname::git+https://github.com/cornellius-gp/gpytorch")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
