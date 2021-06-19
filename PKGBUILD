# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

pkgname=python-javaobj-py3
_name=python-javaobj
pkgver=0.4.3
pkgrel=1
pkgdesc="Module for reading and writing serialized java objects"
url="https://pypi.org/project/javaobj-py3/"
depends=('python')
checkdepends=('maven')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tcalmant/${_name}/archive/${pkgver}.tar.gz")

sha256sums=('49c1a55228d7709f2c537e6684ebd1a3f8faf25d2fe6979104054f0e811bf452')

check() {
    cd "${srcdir}"/${_name}-${pkgver}
    PYTHONPATH=build/lib python -m tests.tests
}

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python setup.py build
}

package() {
    cd "${srcdir}"/${_name}-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
