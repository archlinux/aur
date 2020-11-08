# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-botorch
pkgver=0.3.2
pkgrel=1
pkgdesc='Bayesian Optimization in PyTorch'
arch=('x86_64')
url='https://botorch.org'
license=('MIT')
depends=('python' 'python-pytorch' 'python-gpytorch' 'python-scipy')
optdepends=()
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/pytorch/botorch/archive/v$pkgver.tar.gz")
sha256sums=('51a912f45793dd0876b367aa925df61490308e90d396872b0b231e014465f26e')

_pkgname=botorch

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
