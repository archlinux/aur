# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-caio
_name=${pkgname#python-}
pkgver=0.9.12
pkgrel=1
pkgdesc="Linux AIO c python bindings"
arch=('x86_64')
url="https://github.com/mosquito/caio"
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
#checkdepends=('python-aiomisc-pytest' 'python-pytest-cov')
#source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('20918323ce8b9f7dfddb646f947ceb367dcd57ce4b9fa3f823c3977f5cecac90')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

#check() {
#  cd "$_name-$pkgver"
#  pytest
#}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
