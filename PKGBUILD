# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-piplapis
_pkgname=piplapis-python
pkgver=5.2.3
pkgrel=1
pkgdesc="Python Library for interfacing with pipl.com"
url="https://pypi.org/project/piplapis-python/"
arch=('any')
license=('Apache2')
depends=('python-pytz')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-six')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('53effde6eb0e59401332f9f4a3a54666990782a50cde9d3f8f4d46d111f69f33')

build() {
    cd "piplapis-python-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "piplapis-python-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
