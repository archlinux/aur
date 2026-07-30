# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-owlrl
_name=${pkgname#python-}
pkgver=7.6.2
pkgrel=1
pkgdesc="OWL-RL and RDFS based RDF Closure inferencing for Python"
arch=('any')
url="https://github.com/RDFLib/OWL-RL/"
license=('W3C')
depends=(python-rdflib)
makedepends=(python-build python-installer python-poetry-core python-wheel)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('c743f35c2d908396e77823852bb1ebbce88340cd49961493983bec42c93283a8')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
