# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-poke-env
pkgver=0.4.15
pkgrel=1
pkgdesc='A python interface for training Reinforcement Learning bots to battle
on pokemon showdown'
arch=('x86_64')
url='https://github.com/hsahovic/poke-env'
license=('MIT')
depends=('python' 'python-aiologger' 'python-gym' 'python-numpy'
         'python-requests' 'python-tabulate' 'python-websockets')
optdepends=()
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/hsahovic/poke-env/archive/$pkgver.tar.gz")
sha256sums=('cff7d127f89b590d667c892c4f74a17de92d2acb75b1b395fa88c8854f599717')

_pkgname=poke-env

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
