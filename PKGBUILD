# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-pyshacl
_name=${pkgname#python-}
pkgver=0.31.0
pkgrel=2
pkgdesc="Python SHACL Validator"
arch=('x86_64')
url="https://github.com/RDFLib/pySHACL"
license=('APACHE')
groups=()
depends=('python-rdflib' 'python-prettytable' 'python-owlrl' 'python-packaging' 'python-importlib-metadata')
makedepends=(python-build python-installer python-wheel poetry)
optdepends=()
provides=('python-pyshacl')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
noextract=()
sha512sums=('43cf9786485f02390b6b14d9bb1dd3750574c577367f5fddfa8308a39f675cb14e61978bce5c6c8e50c4536a7becfdd667e37cb4152ab7f10e7699cbdd4425c9')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
