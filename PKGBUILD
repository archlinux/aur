# Maintainer: Letu Ren <fantasquex@gmail.com>

pkgname=python-logical-unification
_pkgname=logical-unification
pkgver=0.4.5
pkgrel=1
pkgdesc="Straightforward unification in Python that's extensible via generic functions."
arch=('any')
url="https://github.com/pythological/unification/"
license=('custom')
depends=(
    'python-toolz'
    'python-multipledispatch'
)
makedepends=(
    'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('7c6a6c1b7c6baa0f5b9af93f06cfc8d2419b6b793346b678ed1367c05ce74558')

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

