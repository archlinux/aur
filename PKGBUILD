# Contributor: Frank Fishburn <frankthefishburn@gmail.com>

pkgname=python-prov
_pypiname=${pkgname/python-/}
pkgver=1.5.2
pkgrel=1
pkgdesc="A library for W3C Provenance Data Model supporting PROV-JSON, PROV-XML and PROV-O RDF"
arch=('any')
url='https://pypi.python.org/pypi/prov/'
license=('MIT')
depends=('python-lxml' 'python-networkx' 'python-dateutil' 'python-six' 'python-pydot' 'python-rdflib')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trungdong/${_pypiname}/archive/${pkgver}.tar.gz")
sha1sums=('9a774a50cc5245b0dea3c4837986d1c2555a89c6')

build() {

    cd $srcdir/${_pypiname}-${pkgver}
    python setup.py build
}

check() {

    cd $srcdir/${_pypiname}-${pkgver}
    make test
}

package() {

    cd $srcdir/${_pypiname}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1

}

