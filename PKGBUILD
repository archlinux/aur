# Maintainer: Aditya Sirish <aditya@saky.in>

pkgname=('python-guardonce')
_srcname=('guardonce')
pkgver=2.4.0
pkgrel=2
pkgdesc="Utilities for converting from C/C++ include guards to #pragma once and back again"
arch=('any')
license=('MIT')
url="https://github.com/cgmb/guardonce"
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('15da5792fba8bfaa246afc03f558ac24b06beee6f072ac81c6aee7c8c3e36395')
makedepends=("git")

validpgpkeys=("0CE06FE392AA48F8D22E4471F9EF8EE0C021630F")

build() {
    cd "${srcdir}/$_srcname-$pkgver"
    python setup.py build
}

package() {
    cd "${srcdir}/$_srcname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
