# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_module='msgfy'
pkgname=python-${_module}
pkgver=0.2.1
pkgrel=1
pkgdesc="A Python library for converting an Exception instance into a human-readable error message"
url="https://github.com/thombashi/${_module}"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("${_module}-${pkgver}.tgz::https://github.com/thombashi/${_module}/archive/v${pkgver}.tar.gz")
sha256sums=('f705a968b193270acc8784cb1c9e9843bd09ff9c157a1e326864119dfde393b8')

build() {
    cd "${srcdir}/${_module}-${pkgver}"

    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
