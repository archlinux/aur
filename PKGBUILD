# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-poke-env
pkgver=0.8.0
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/hsahovic/poke-env/archive/$pkgver.tar.gz")
sha256sums=('163c99e670fce6a5afb0f6028937ddbcff9fdf0e3d55c652ad2ba0cfd092c782')

_pkgname=poke-env

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
