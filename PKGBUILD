# Maintainer: Sid Karunaratne <sid at karunaratne dot net>
pkgname=weevely
_pkgname=weevely3
pkgver=3.2.0
pkgrel=1
pkgdesc="a stealth PHP web shell that provides a telnet-like console"
arch=('any')
url="https://github.com/epinna/weevely3"
license=('GPL3')
depends=(python2 python2-prettytable python2-mako python2-dateutils python2-utils)
source=("https://github.com/epinna/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('7a148a59a0b02836e6c182cfab8127bd9ef0abe8f71df9c5e9a63c28492665d7')

build() {
    sed -i 's#/usr/bin/env python#/usr/bin/env python2#' ${srcdir}/${_pkgname}-${pkgver}/weevely.py
}

package() {
    install -dm755 "${pkgdir}/usr/"{bin,lib}
    cp -r "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/usr/lib/${pkgname}"
    ln -sf "/usr/lib/${pkgname}/${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}"
}
