# Maintainer: Chinmay Dalal <dalal dot chinmay dot zero one zero one at gmail dot com>
pkgname="python-hyperer"
pkgrel=2
arch=("any")
pkgver=0.2.1
license=("GPL3")
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("9ce7e3d5ddf2dd24ac29d5188a8a4292b5d498b954656b68bdf002eb843fe752")
depends=("python>=3.9")
makedepends=(python-build python-installer python-wheel python-poetry)

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
