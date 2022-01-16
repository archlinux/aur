# Maintainer: Popolon <popolon@popolon.org>

pkgbase='python-redis-collections'
pkgname=('python-redis-collections')
_module='redis-collections'
pkgver='0.9.1'
pkgrel=1
pkgdesc="Set of basic Python collections backed by Redis."
url="https://github.com/redis-collections/redis-collections"
depends=('python')
makedepends=('python-setuptools')
license=('custom:ISC License (ISCL)')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('b018cddabfc9f2bdae63a771607051e5f88857219e421281168a67dfe17aa1d1')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
