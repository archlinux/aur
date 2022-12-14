# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-owlrl
_name=${pkgname#python-}
pkgver=6.0.2
pkgrel=1
pkgdesc="OWL-RL and RDFS based RDF Closure inferencing for Python"
arch=('x86_64')
url="https://github.com/RDFLib/OWL-RL/"
license=('W3C')
groups=()
depends=('python-rdflib')
makedepends=('python-setuptools')
optdepends=()
provides=('python-owlrl')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
noextract=()
md5sums=('034f9262901fb82761ba5337bbfa0445')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
