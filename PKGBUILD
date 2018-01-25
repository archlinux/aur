# Maintainer: Michael Gisbers <michael@gisbers.de>
pkgname=flashprint
pkgver=3.21.0
pkgrel=1
pkgdesc="Slicer for the FlashForge 3D printers."
### no i686 link for version 3.16.0 available
#arch=('i686' 'x86_64')
arch=('x86_64')
url="http://www.ff3dp.com/"
depends=('qt5-base')
license=('custom')
source=("${pkgname}-${pkgver}_amd64.deb::http://www.sz3dp.com/upfile/2018/01/25/20180125091409_766.deb" "flashprint")
#source_i686=("${pkgname}-${pkgver}_i686.deb::http://www.sz3dp.com/upfile/2017/01/03/20170103151329_822.deb" "flashprint")


package() {
    cd ${pkgdir}
    tar -Jxvf ${srcdir}/data.tar.xz
    install -d ${pkgdir}/usr/bin
#    ln -s ../share/FlashPrint/FlashPrint ${pkgdir}/usr/bin/flashprint
    # workaround for render issues
    install ${srcdir}/flashprint ${pkgdir}/usr/bin/flashprint
    # patch desktop file, workaround for render issues
    sed -i "/^Exec=/ c Exec=/usr/bin/flashprint" ${pkgdir}/usr/share/applications/FlashPrint.desktop
}



md5sums=('93b6e3b4afdf4c79f7496ed45415443e'
         '1fa4e9abedbfb0fe9744986e2725d443')
sha256sums=('07be6ecd8381a9c24883fdbea23e5be8a08a9b7cb5b9640b347d09cefaca7646'
            'c981bd5d01b885ee952331f60a5545f1e667055f2c1fd0a37d9bb1d227bc281a')
sha512sums=('90661305cf469aadd0b4ac41b4e2524c444388f1736cbc291bd4fa5e1fe7d8ef429f4d7a32ce2fefc731a15a865769b2bb3e31b1a51d1557919c8875232d2612'
            'e233d1f4eac6b69ecb43bbd2a7a18ded87896109d1e20b7e41cae76377bd16901fd8defa7d89225a958f2d80aa44de52d8a6533619a2fc237aaae056d971fe0f')
