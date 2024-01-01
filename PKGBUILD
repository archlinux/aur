# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-pyshacl
_name=${pkgname#python-}
pkgver=0.25.0
pkgrel=2
pkgdesc="Python SHACL Validator"
arch=('x86_64')
url="https://github.com/RDFLib/pySHACL"
license=('APACHE')
groups=()
depends=('python-rdflib')
makedepends=(python-build python-installer python-wheel)
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
md5sums=('7e13c493aa917e6756f0f0df56b2811d')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
