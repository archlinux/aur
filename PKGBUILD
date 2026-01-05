# Maintainer: Storm Dragon <storm_dragon@stormux.org>
pkgname=python-platform-utils
_pkgname=platform_utils
pkgver=1.6.0
pkgrel=1
pkgdesc="Cross-platform utilities for accomplishing some tasks that the stdlib isn't equipped to provide"
arch=('any')
url="https://pypi.org/project/platform_utils/"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('cd44f1ccaf720fe67d50c6c034907a596191ae185cb379765040b862187889bdc88ed048f119d8dba6022dfde55811a394c66e1353596d5cc61ac0a6ce759481')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
