# $Id$
# Maintainer: Michael Greene <mgreene@securityinnovation.com>

pkgname=python-solid
pkgver=0.2.0
pkgrel=1
pkgdesc="SolidPython: OpenSCAD for Python"
arch=('any')
license=('LGPL2.1')
url="https://github.com/SolidCode/SolidPython"
makedepends=()
depends=('python-euclid3' 'python-pypng' 'python-prettytable')
source=("https://pypi.io/packages/source/s/solidpython/solidpython-${pkgver}.tar.gz")
sha256sums=(1047f222ce57335fdb3a91b2d90e1a36ed25cf1b627987b56de313032f5ac1d6)
sha384sums=(cad00aa017d7d62b31f5cc97a108f68ebad41fc141551cff8ab81f3f54a91e797d19300f51d5d1b0f6b3fba3df946623)
sha512sums=()

build() {
    cd ${srcdir}/solidpython-${pkgver}
    python setup.py build
}

package() {
    cd solidpython-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
