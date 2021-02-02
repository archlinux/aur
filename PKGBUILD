# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

pkgname=python-javaobj-py3
_name=python-javaobj
pkgver=0.4.2
pkgrel=1
pkgdesc="Module for reading and writing serialized java objects"
url="https://pypi.org/project/javaobj-py3/"
depends=('python')
checkdepends=('maven')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tcalmant/${_name}/archive/${pkgver}.tar.gz")

sha256sums=('056cee21aa8297e66b9381e5e0b04b6c9427bd022a67edc711d89ba677f3f8af')

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
