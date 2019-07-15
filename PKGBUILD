# Maintainer: Michael Gisbers <michael@gisbers.de>
pkgname=flashprint
pkgver=3.28.0
pkgrel=1
pkgdesc="Slicer for the FlashForge 3D printers."
arch=('x86_64')
url="http://www.ff3dp.com/"
depends=('qt5-base')
license=('custom')
source=("${pkgname}-${pkgver}_amd64.deb::http://www.ishare3d.com/3dapp/public/FlashPrint-ii/FlashPrint/flashprint_3.28.0_amd64.deb" "flashprint")


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




md5sums=('8b40f4d5c3db975ca8515da260caec3b'
         '1fa4e9abedbfb0fe9744986e2725d443')
sha256sums=('cc9a368137365ecc4fc4f5b6fca1e7e8c74c43e15d3273154a0c0d091c849b95'
            'c981bd5d01b885ee952331f60a5545f1e667055f2c1fd0a37d9bb1d227bc281a')
sha512sums=('64546af792a462a7b28d2d570b8eb0c8b00f3864108f35f6d2c9776b26cf9d751556eb14bb8c837b8cae414bd82cfe2ac5f2d4baf631575cc65f2417eaeb367a'
            'e233d1f4eac6b69ecb43bbd2a7a18ded87896109d1e20b7e41cae76377bd16901fd8defa7d89225a958f2d80aa44de52d8a6533619a2fc237aaae056d971fe0f')
