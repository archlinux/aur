# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-psycopg-c
# source is shared with python-psycopg package, hence the weird naming
_pkgname=psycopg
pkgver=3.2.4
pkgrel=1
pkgdesc='psycopg C extension'
arch=('x86_64')
url='https://www.psycopg.org/psycopg3/'
license=('LGPL-3.0-only')
depends=('postgresql-libs' 'python' 'python-psycopg')
makedepends=(
  'cython'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/psycopg/psycopg/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('1b74f8a6ee91266fb6c6a13ee51fd7d18514b4ce662f911f83baba652bb9198cae21636f6f1dad6eae916cc2c22f2322629dea346e61ce94a1d94a80c8e8b5be')

build(){
  cd "$_pkgname-$pkgver/psycopg_c"

  python -m build --wheel --no-isolation
}

package(){
  cd "$_pkgname-$pkgver/psycopg_c"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
