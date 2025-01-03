# Maintainer: Storm Dragon <storm_dragon@stormux.org>
pkgname=python-platform-utils
_pkgname=platform_utils
pkgver=1.5.4
pkgrel=1
pkgdesc="Cross-platform utilities for accomplishing some tasks that the stdlib isn't equipped to provide"
arch=('any')
url="https://pypi.org/project/platform_utils/"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('SKIP')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
