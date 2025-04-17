# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-caio
_name=${pkgname#python-}
pkgver=0.9.22
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
sha256sums=('429458b292a44366bc84bd96d93acc505b86a7270e6f7ff1810724c9bbb2b51d')

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
