# Maintainer: Liam Timms <timms5000@gmail.com>

pkgname=python-dicom_parser
_pypiname=${pkgname/python-/}
pkgver=v1.2.2.r34.g859c522
pkgrel=1
pkgdesc="A library for W3C Provenance Data Model supporting PROV-JSON, PROV-XML and PROV-O RDF"
arch=('any')
url='https://pypi.python.org/pypi/prov/'
license=('MIT')
optdepends=('python-pandas')
makedepends=('git' 'python-setuptools')
source=("${pkgname}::git+https://github.com/open-dicom/${_pypiname}.git")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {

    cd $srcdir/${pkgname}
    python setup.py build
}

# check() {
#
#     cd $srcdir/${_pypiname}-${pkgver}
#     make test
# }

package() {

    cd $srcdir/${pkgname}
    python setup.py install --root="${pkgdir}/" --optimize=1

}

