# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-pyshacl
_name=${pkgname#python-}
pkgver=0.40.2
pkgrel=1
pkgdesc="Python SHACL Validator"
arch=('any')
url="https://github.com/RDFLib/pySHACL"
license=('APACHE')
depends=(python-rdflib python-prettytable python-owlrl python-packaging)
makedepends=(python-build python-installer python-poetry-core python-wheel)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('411de90db9932930725d96f6b4c88442f0c36e4353894d3c8cc86b7185a88a4ca5edf769632ffb64c3fcf163f2c886a85980ec0fe1a64a1f2f6652de7022bc5b')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
