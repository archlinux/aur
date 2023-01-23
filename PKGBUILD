# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=docplex
pkgname=python-docplex
pkgver=2.25.236
pkgrel=1
pkgdesc="The IBM Decision Optimization CPLEX Modeling for Python"
arch=('any')
url="https://pypi.org/project/docplex/"
license=('Apache')
depends=('python-six')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
b2sums=('8b0cb0c9853f7fda86928366947acb2070b53d5c3771d2135a1fd017746b2459ce18327bf11e44a4384522fdec3c9ef62c51c89263419f42708935a166d9ac41')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
