# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-caio
_name=${pkgname#python-}
pkgver=0.9.21
pkgrel=1
pkgdesc="Linux AIO c python bindings"
arch=('x86_64')
url="https://github.com/mosquito/caio"
license=('Apache-2.0')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
#checkdepends=(
#  'python-pytest'
#  'python-pytest-aiohttp'
##  'python-pytest-aiomisc'  ## TODO
#  'python-pytest-asyncio'
#)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f16390dd70d2432351aee783eb2d7be796e2879ac4cd1cf8e75bd1901b148060')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

#check() {
#  cd "$_name-$pkgver"
#  PYTHONPATH=. pytest
#}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
