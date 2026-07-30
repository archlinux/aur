# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-pyshacl
_name=${pkgname#python-}
pkgver=0.40.1
pkgrel=1
pkgdesc="Python SHACL Validator"
arch=('any')
url="https://github.com/RDFLib/pySHACL"
license=('APACHE')
depends=(python-rdflib python-prettytable python-owlrl python-packaging)
makedepends=(python-build python-installer python-poetry-core python-wheel)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('8ffcc14d298823bfe69eba7c1097400ba7affaaeb51c396ba3774bbfe5024b5909090ae2b53bf23c277fc46f22564aa74464efdff89d5e84477562bb8133711a')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
