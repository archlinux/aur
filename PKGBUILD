# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

pkgname=python-javaobj-py3
_name=python-javaobj
pkgver=0.4.1
pkgrel=1
pkgdesc="Module for reading and writing serialized java objects"
url="https://pypi.org/project/javaobj-py3/"
depends=('python')
checkdepends=('maven')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tcalmant/${_name}/archive/${pkgver}.tar.gz")

sha256sums=('ff7408e5a0ac2c6728d130fdc575bd7eee9a01c61995d88f7d33aa9b109b9685')

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
