# Maintainer: Marcus Johansson <polarn@gmail.com>

pkgname=python-classdiff
_name=${pkgname#python-}
pkgver=0.5.0
pkgrel=1
pkgdesc="Utility to diff classes"
url="https://pypi.org/project/classdiff/"
depends=(
  'python-dictdiffer'
  'python-deepdiff')
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel')
license=('Apache-2.0')
arch=(any)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1224b5858e88b388acfe301f594a34b4b23245f5b02a3826f232c9a1c05e2073')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
