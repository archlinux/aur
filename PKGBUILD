# Maintainer: Aditya Sirish <aditya@saky.in>

pkgname=('python-guardonce')
srcname=('guardonce')
pkgver=2.4.0
pkgrel=1
pkgdesc="Utilities for converting from C/C++ include guards to #pragma once and back again"
arch=('any')
license=('MIT')
url="https://github.com/cgmb/guardonce"
source=("git+${url}.git?signed#tag=v${pkgver}")

sha256sums=('SKIP')

validpgpkeys=("0CE06FE392AA48F8D22E4471F9EF8EE0C021630F")

build() {
    cd "${srcdir}/${srcname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${srcname}"
    python setup.py install --root="$pkgdir" --optimize=1
    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
