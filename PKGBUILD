# Maintainer: Marcus Johansson <polarn@gmail.com>

pkgname=python-classdiff
_name=${pkgname#python-}
pkgver=0.3.0
pkgrel=1
pkgdesc="Utility to diff classes"
url="https://pypi.org/project/classdiff/"
depends=(
  'python-dictdiffer')
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel')
license=('Apache-2.0')
arch=(any)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('64f631bbdf171429b5e03556ab0952dfdff63cb3d37340e81646c49f831a4f89')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
