# Maintainer: Mark Collins <tera_1225 [aaht] hotmail ðot com>
pkgname=python-cpe
_name="${pkgname#python-}"
pkgver=1.3.0
pkgrel=1
pkgdesc="Common Platform Enumeration for Python"
arch=(any)
url="https://github.com/nilp0inter/cpe"
license=('LGPL-3.0-only')
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
sha256sums=('797b85a2d12c4857a39b21d67ef8d87e2ea14c352c2ebceb5a69ed375b757b87')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
