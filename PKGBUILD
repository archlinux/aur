# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python-deltachat2
_pkgname=deltachat2
pkgver=0.9.0
pkgrel=1
pkgdesc="Delta Chat client library for Python"
url="https://pypi.org/project/deltachat2/"
depends=(python)
license=('MPL-2.0')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/d/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
makedepends=('python-setuptools-scm>=8' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
sha256sums=('9257a644360dc19b301bcb35924c25b47925a396f77afcf2d86d37ff8e816995')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
