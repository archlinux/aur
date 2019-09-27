# Maintainer: Liam Timms <timms5000@gmail.com>
# Contributor: Frank Fishburn <frankthefishburn@gmail.com>

pkgname=python-prov
_pypiname=${pkgname/python-/}
pkgver=1.5.3
pkgrel=2
pkgdesc="A library for W3C Provenance Data Model supporting PROV-JSON, PROV-XML and PROV-O RDF"
arch=('any')
url='https://pypi.python.org/pypi/prov/'
license=('MIT')
depends=('python-lxml' 'python-networkx' 'python-dateutil' 'python-six' 'python-pydot' 'python-rdflib')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trungdong/${_pypiname}/archive/${pkgver}.tar.gz")
sha1sums=('462034925acbcd458b2e5b45063bf4a2a5a97c4d')

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

