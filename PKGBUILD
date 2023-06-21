# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-poke-env
pkgver=0.7.0
pkgrel=1
pkgdesc='A python interface for training Reinforcement Learning bots to battle
on pokemon showdown'
arch=('x86_64')
url='https://github.com/hsahovic/poke-env'
license=('MIT')
depends=('python' 'python-gym' 'python-numpy' 'python-orjson'
         'python-requests' 'python-tabulate' 'python-websockets')
optdepends=()
makedepends=('python' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/hsahovic/poke-env/archive/$pkgver.tar.gz")
sha256sums=('0ce267e018d02a786c8681c479fd5bff01ae8cd8be028edb2575807944a8004f')

_pkgname=poke-env

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
