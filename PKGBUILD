# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-pyshacl
_name=${pkgname#python-}
pkgver=0.20.0
pkgrel=1
pkgdesc="Python SHACL Validator"
arch=('x86_64')
url="https://github.com/RDFLib/pySHACL"
license=('APACHE')
groups=()
depends=('python-rdflib')
makedepends=('python-setuptools')
optdepends=()
provides=('python-brickschema')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
noextract=()
md5sums=('63c1eb58c26072ea73741b143cae8a44')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
