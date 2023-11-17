# Maintainer: Marcus Johansson <polarn@gmail.com>

pkgname=python-classdiff
_name=${pkgname#python-}
pkgver=0.2.0
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
sha256sums=('a6897c95e6fed9dd1798a045ed1d6ab1b07b6632aedc9290d4a9313ef2f9b999')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
