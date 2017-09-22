# $Id$
# Maintainer: Michael Greene <mgreene@securityinnovation.com>

pkgname=python-euclid3
pkgver=0.01
pkgrel=2
pkgdesc="2D and 3D vector, matrix, quaternion and geometry module."
arch=('any')
license=('LGPL2.1')
url="https://github.com/SolidCode/SolidPython"
makedepends=()
depends=()
source=("https://pypi.io/packages/source/e/euclid3/euclid3-${pkgver}.tar.gz")
sha256sums=(25b827a57adbfd9a3fa8625e43abc3e907f61de622343e7e538482ef9b46fd0b)
sha384sums=(843ad5cb5f637e508579265548679126a99fb3b9a48315fc55edd73ba2ddc809bbb1484db3adc2a86ca3cebcc5b0c668)

prepare() {
    cp -a euclid3-${pkgver}{,-python2}
}

build() {
    # Build Python 3 module
    cd ${srcdir}/euclid3-${pkgver}
    python3 setup.py build

    # Build Python 2 module
    cd ${srcdir}/euclid3-${pkgver}-python2
    python2 seutp.py build
}

package_python-euclid3() {
    cd euclid3-${pkgver}
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-euclid3() {
    cd euclid3-${pkgver}-python2
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
