# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Liam Timms <timms5000@gmail.com>
# Contributor: Frank Fishburn <frankthefishburn@gmail.com>

pkgname=python-prov
_pypiname=${pkgname/python-/}
pkgver=2.1.1
pkgrel=1
pkgdesc="A library for W3C Provenance Data Model supporting PROV-JSON, PROV-XML and PROV-O (RDF)"
arch=('any')
url='https://pypi.python.org/pypi/prov/'
license=('MIT')
depends=('python-lxml' 'python-networkx' 'python-dateutil' 'python-pydot' 'python-rdflib' 'python-matplotlib' 'python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trungdong/${_pypiname}/archive/${pkgver}.tar.gz")
sha1sums=('2a9e2011e347120723ccfd3439a8763bfca7fe16')

build() {

    cd $srcdir/${_pypiname}-${pkgver}
    python setup.py build
}

#check() {
#
#    cd $srcdir/${_pypiname}-${pkgver}
#    make test
#}

package() {

    cd $srcdir/${_pypiname}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1

}

