# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-pyshacl
_name=${pkgname#python-}
pkgver=0.30.1
pkgrel=1
pkgdesc="Python SHACL Validator"
arch=('x86_64')
url="https://github.com/RDFLib/pySHACL"
license=('APACHE')
groups=()
depends=('python-rdflib')
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
md5sums=('acc71b21ec292f64526cb323dc446786')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
