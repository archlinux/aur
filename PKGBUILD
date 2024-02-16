# Maintainer: Marcus Johansson <polarn@gmail.com>

pkgname=python-classdiff
_name=${pkgname#python-}
pkgver=0.4.0
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
sha256sums=('c3af9da2d9e760a4ef436f61de0c04f663d408b6155a59f3f8df6fb037b05d11')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
