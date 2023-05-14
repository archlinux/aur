#Maintainer GI Jack <GI_Jack@hackermail.com>

pkgname=python-neotime
_pkgname=neotime
_pypidir="0b/7e/ca368a8d8e288be1352d4e2df35da1e01f8aaffbf526695df71630bcb8a6"
pkgver=1.7.4
pkgrel=2
pkgdesc="Python classes for working with temporal data to nanosecond precision"
url="https://pypi.org/project/neotime/"
arch=('any')
license=('Apache')
depends=('python' 'python-six' 'python-pytz')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('4e0477ba0f24e004de2fa79a3236de2bd941f20de0b5db8d976c52a86d7363eb')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
