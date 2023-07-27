# Maintainer: Egor Tensin <Egor.Tensin@gmail.com>
pkgname=cmake-common
_name="${pkgname//-/_}"
pkgver=4.0
pkgrel=2
pkgdesc='Utilities to help develop C++/CMake projects'
arch=(any)
url="https://github.com/egor-tensin/$pkgname"
license=(MIT)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
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
