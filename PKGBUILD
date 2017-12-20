# Maintainer: Michael Gisbers <michael@gisbers.de>
pkgname=flashprint
pkgver=3.20.1
pkgrel=1
pkgdesc="Slicer for the FlashForge 3D printers."
### no i686 link for version 3.16.0 available
#arch=('i686' 'x86_64')
arch=('x86_64')
url="http://www.ff3dp.com/"
depends=('qt5-base')
source=("${pkgname}-${pkgver}_amd64.deb::http://www.ishare3d.com/3dapp/public/FlashPrint-ii/flashprint_${pkgver}_amd64.deb" "flashprint")
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

md5sums=('b5d19b5afbef5bde190cf098ef95ba07'
         '1fa4e9abedbfb0fe9744986e2725d443')
sha256sums=('d09304d4d50e81d4f3ee44d89b727e2aa9c49ef34a3cb9eb2b8ca81366081b91'
            'c981bd5d01b885ee952331f60a5545f1e667055f2c1fd0a37d9bb1d227bc281a')
sha512sums=('32e8e0f9709eb03add1dacd9f9594cbe104c713d1d208bccb5e8acff26e64df5a07260e7011c5daf00521b71a303faa901709e2d246654a37b013230eb0cc2b4'
            'e233d1f4eac6b69ecb43bbd2a7a18ded87896109d1e20b7e41cae76377bd16901fd8defa7d89225a958f2d80aa44de52d8a6533619a2fc237aaae056d971fe0f')
