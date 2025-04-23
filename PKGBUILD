# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-caio
_name=${pkgname#python-}
pkgver=0.9.24
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
#source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5bcdecaea02a9aa8e3acf0364eff8ad9903d57d70cdb274a42270126290a77f1')

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
