# $Id$
# Maintainer:  Radu Potop <radu at wooptoo dot com>

pkgname=usbmon
pkgver=6.1
pkgrel=2
pkgdesc="USB monitoring framework"
arch=("x86_64")
url="https://github.com/radupotop/usbmon"
makedepends=("make" "gcc")
license=("GPL")
source=(
    "${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"
)

build() {
    cd ${pkgname}-${pkgver}
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    install -vDm 755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -vDm 644 README     "${pkgdir}/usr/share/doc/${pkgname}/README"
    install -vDm 644 COPYING    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    install -vDm 644 usbmon.8   "${pkgdir}/usr/share/man/man8/usbmon.8"
}

sha256sums=('30985b48f3c29901a1ed2a18af6b1f70d290d5d45cc44c5afdc3ade6d1816b84')
