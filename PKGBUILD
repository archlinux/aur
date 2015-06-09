# Maintainer : Ng Oon-Ee <ngoonee.talk@gmail.com>

pkgname=gctwimax
pkgver=0.0.3rc4
pkgrel=1
pkgdesc="Linux driver for GDM7213 & GDM7205 GCT Semiconductor WiMax chip. Used
by YTL's YES 4G service for it's Yes Go dongle."
arch=('i686' 'x86_64') 
url="https://code.google.com/p/gctwimax"
license=('custom')
depends=('libusb' 'libeap')
source=('http://gctwimax.googlecode.com/files/gctwimax-0.0.3rc4.tar.gz'
        'http://gctwimax.googlecode.com/files/gctwimax-0.0.3rc4_libusb_context_fix.patch')

build()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    patch -p1 < ${srcdir}/${pkgname}-${pkgver}_libusb_context_fix.patch
    make
}
package()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    install -D gctwimax ${pkgdir}/usr/bin/gctwimax
    install -D src/event.sh ${pkgdir}/usr/share/gctwimax/event.sh
    install -D src/gctwimax.conf ${pkgdir}/usr/share/gctwimax/gctwimax.conf
}
md5sums=('55d643a2e18811207b96a31751dcd2ab'
         '3caa82128bc96e2386124219c2afbfbe')
