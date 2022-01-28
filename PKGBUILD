# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-poke-env
pkgver=0.4.21
pkgrel=1
pkgdesc='A python interface for training Reinforcement Learning bots to battle
on pokemon showdown'
arch=('x86_64')
url='https://github.com/hsahovic/poke-env'
license=('MIT')
depends=('python' 'python-gym' 'python-numpy' 'python-orjson'
         'python-requests' 'python-tabulate' 'python-websockets')
optdepends=()
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/hsahovic/poke-env/archive/$pkgver.tar.gz")
sha256sums=('ab7c58e63ffcb0142d56838a6293e55836e697efb6889367c5d596849f787554')

_pkgname=poke-env

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
