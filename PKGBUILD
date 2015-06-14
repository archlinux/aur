# Maintainer: Daniel Hillenbrand <codeworkx [at] bbqlinux [dot] org>

pkgname=dvb-tevii-fw
pkgver=20140428
pkgrel=1
pkgdesc="Firmware for Tevii DVB-S/S2 cards and boxes"
arch=('any')
url="http://www.tevii.com"
license=('unknown')
makedepends=('tar')
conflicts=('dvb-fe-ds3000-fw' 'dvb-tevii-s482-fw')
source=('http://www.tevii.com/Tevii_Product_20140428_media_build_b6.tar.bz2.rar')
sha1sums=('b81a4f7b6406c8dc9705904869e57240d489c1e2')

build() {
    cd "${srcdir}"
    tar jxfv ${srcdir}/Tevii_Product_20140428_media_build_b6.tar.bz2.rar
}

package() {
    mkdir -p ${pkgdir}/usr/lib/firmware
    cd "${srcdir}"
    install -D -m644 ${srcdir}/b6/media_build/*.fw ${pkgdir}/usr/lib/firmware
}
