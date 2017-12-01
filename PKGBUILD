# Maintainer: Michael Gisbers <michael@gisbers.de>
pkgname=flashprint
pkgver=3.20.0
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

md5sums=('0414b67be197d9c95ab21489b04e9e2e'
         '1fa4e9abedbfb0fe9744986e2725d443')
sha256sums=('10aefae5b50674645fb72841f5a1f0ee3e6a00bf8e15ba843b50c728354fe74a'
            'c981bd5d01b885ee952331f60a5545f1e667055f2c1fd0a37d9bb1d227bc281a')
sha512sums=('1e7c56f22df5f90a2098a3d794fdf0fea83cc53a65a6af4cdb5b83045b2847e67223458b10815f75c133eeebd309ce9c1bf25953d36b81ac4f1d47f838ef8a35'
            'e233d1f4eac6b69ecb43bbd2a7a18ded87896109d1e20b7e41cae76377bd16901fd8defa7d89225a958f2d80aa44de52d8a6533619a2fc237aaae056d971fe0f')
