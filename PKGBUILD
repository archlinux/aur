# Maintainer: Morten Linderud <morten@linderud.pw>

pkgbase=python-marshmallow
pkgname=('python-marshmallow' 'python2-marshmallow')
pkgver=2.13.5
pkgrel=2
pkgdesc="A lightweight library for converting complex objects to and from simple Python datatypes."
url="https://github.com/marshmallow-code/marshmallow"
license=('MIT')
arch=('any')
makedepends=('python' 'python-setuptools'
             'python2' 'python2-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/marshmallow-code/marshmallow/archive/${pkgver}.tar.gz")
sha256sums=('a58258288e4de144fb2e0ecf2085fd4a383639ce105ea2d0544e6dff1892a462')


build() {
    cd "${srcdir}/${pkgbase#python-}-${pkgver}"
    python setup.py build
    python2 setup.py build
}

package_python-marshmallow() {
    depens=('python')
    optdepends=('python-dateutil: robust datetime deserialization'
                'python-simplejson: precision when (de)serializing Python decimal.Decimal types')
    cd "${srcdir}/${pkgbase#python-}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-marshmallow() {
    depens=('python2')
    optdepends=('python2-dateutil: robust datetime deserialization'
                'python2-simplejson: precision when (de)serializing Python decimal.Decimal types')
    cd "${srcdir}/${pkgbase#python-}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
