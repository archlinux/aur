# Maintainer: Egor Tensin <Egor.Tensin@gmail.com>
pkgname=cmake-common
_name="${pkgname//-/_}"
pkgver=3.4
pkgrel=1
pkgdesc='Various utilities to help develop C++/CMake projects'
arch=(any)
url='https://github.com/egor-tensin/cmake-common'
license=(MIT)
makedepends=(python-build python-installer python-wheel)
depends=(python)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=(SKIP)

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
