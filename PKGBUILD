# Maintainer: Sid Karunaratne <sid at karunaratne dot net>
pkgname=weevely
_pkgname=weevely3
pkgver=3.1.0
pkgrel=2
pkgdesc="a stealth PHP web shell that provides a telnet-like console"
arch=('any')
url="http://epinna.github.com/Weevely"
license=('GPL3')
depends=(python2 python2-prettytable python2-mako python2-dateutils python2-utils)
source=("https://github.com/epinna/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ca43f90bc9fce25efc26d6f0fb3067e9e793b17aed38372c69e61faefa5d1654')

build() {
    sed -i 's#/usr/bin/env python#/usr/bin/env python2#' ${srcdir}/${_pkgname}-${pkgver}/weevely.py
}

package() {
    install -dm755 "${pkgdir}/usr/"{bin,lib}
    cp -r "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/usr/lib/${pkgname}"
    ln -sf "/usr/lib/${pkgname}/${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}"
}
