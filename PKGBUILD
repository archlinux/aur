# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-winsspi
_pkgname=winsspi
pkgver=0.0.11
pkgrel=1
pkgdesc="Windows SSPI wrapper in pure python"
url="https://pypi.org/project/winsspi"
arch=('any')
license=('MIT')
depends=('python' 'python-minikerberos')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('0170ba489fa258f1aa4e6760a162846c3f2d0d451c836683eb4f613b66dd41f3')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
