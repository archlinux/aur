# Maintainer: Mark Collins <tera_1225 [aaht] hotmail ðot com>
pkgname=python-cpe
_name="${pkgname#python-}"
pkgver=1.2.1
pkgrel=1
pkgdesc="Common Platform Enumeration for Python"
arch=(any)
url="https://github.com/nilp0inter/cpe"
license=('LGPL')
depends=(
  python
)
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-wheel
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e742635e13cc0f6e02cb62a367dc789fb0e7dba1317822a8760c8de312e36ec9')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
