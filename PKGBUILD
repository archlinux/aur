# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-poke-env
pkgver=0.4.4
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
sha256sums=('abc040621e1b108184d91465c8592573d8a2fd26be4b83b3cb9782a3d7309168')

_pkgname=poke-env

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
