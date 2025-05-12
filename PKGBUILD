# Maintainer: Marcus Johansson <polarn@gmail.com>

pkgname=python-classdiff
_name=${pkgname#python-}
pkgver=0.5.1
pkgrel=1
pkgdesc="Utility to diff classes"
url="https://pypi.org/project/classdiff/"
depends=(
  'python-dictdiffer'
  'python-deepdiff')
makedepends=(
  'python-build'
  'python-poetry-core'
  'python-installer'
  'python-wheel')
license=('Apache-2.0')
arch=(any)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('0f98690bb73cf554fc39cc8654b94cbb2b14ce714933f84904c24a9f79907450')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
