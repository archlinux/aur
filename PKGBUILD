# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=python-aranet4
_name=${pkgname#python-}
pkgver=2.5.1
pkgrel=1
pkgdesc="Python client for Aranet4 CO2 sensors"
arch=(any)
url="https://github.com/Anrijs/Aranet4-Python"
license=('MIT')
depends=('python-bleak' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('345152ad49f07362d9ecd1aad60406e8126dafca484e7796bc8b1eece6990c99')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
