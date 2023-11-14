# Maintainer: Popolon <popolon@popolon.org>

_module='redis-collections'
pkgbase="python-${_module}"
pkgname="python-${_module}"
pkgver=0.12.0
pkgrel=1
pkgdesc="Set of basic Python collections backed by Redis."
url="https://github.com/redis-collections/redis-collections"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-pip')
license=('custom:ISC License (ISCL)')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('d7ccc40ddb174eef8343e85b40a33cea4b1faae5e45bdd95cb51bd7aeeba2b6e')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
