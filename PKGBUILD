# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-caio
_name=${pkgname#python-}
pkgver=0.9.17
pkgrel=1
pkgdesc="Linux AIO c python bindings"
arch=('x86_64')
url="https://github.com/mosquito/caio"
license=('Apache-2.0')
depends=(
  'python'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
#checkdepends=(
#  'python-aiomisc'  ## TODO
#  'python-pytest'
#  'python-pytest-aiohttp'
#)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('af63a39624b36bdc838b8bfe4c02995a047ce36728e98db4e574b4dceb6eba81')

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
