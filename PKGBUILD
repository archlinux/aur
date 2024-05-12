# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-piplapis
_pkgname=piplapis-python
pkgver=5.3.1
pkgrel=1
pkgdesc="Python Library for interfacing with pipl.com"
url="https://pypi.org/project/piplapis-python/"
arch=('any')
license=('Apache2')
depends=('python-pytz')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-six')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ef1d1c3b9782ed212767631068381f0145f69967bba3c690db3167b1e26db611')

build() {
    cd "piplapis-python-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "piplapis-python-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
