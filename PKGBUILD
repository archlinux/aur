# Maintainer: GI Jack <GI_Jack@hackermail.com>

pkgname=python-cherrypy-cors
_pkgname=cherrypy-cors
pkgver=1.7.0
pkgrel=1
pkgdesc="CORS support for CherryPy"
arch=('any')
url="https://pypi.org/project/cherrypy-cors/"
license=('MIT')
depends=('python' 'python-cherrypy' 'python-httpagentparser')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('83384cd664a7ab8b9ab7d4926fe9713acfe0bce3665ee28189a0fa04b9f212d6')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
