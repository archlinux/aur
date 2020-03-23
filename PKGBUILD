# Maintainer: Michael Gisbers <michael@gisbers.de>
pkgname=flashprint
pkgver=4.2.0
pkgrel=1
pkgdesc="Slicer for the FlashForge 3D printers."
arch=('x86_64')
url="http://www.ff3dp.com/"
depends=('qt5-base')
license=('custom')
source=("${pkgname}-${pkgver}_amd64.deb::http://www.ishare3d.com/3dapp/public/FlashPrint-ii/FlashPrint/flashprint_${pkgver}_amd64.deb" "${pkgname}")


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




md5sums=('8b24b93c082b2f039b141d47b7da0436'
         '1fa4e9abedbfb0fe9744986e2725d443')
sha256sums=('cfb61ebf6ddfd330cae14f02e39d3e6ce69c57eac0d404ef8cbdca2eb7e0e373'
            'c981bd5d01b885ee952331f60a5545f1e667055f2c1fd0a37d9bb1d227bc281a')
sha512sums=('86584d5b12ea5c613f49d25d5207b1ce61bf7ff88f41d19671442ffe4980b06b5877aae6be2b4578ec70408daa928802c48add22729b0c037e2638566f708279'
            'e233d1f4eac6b69ecb43bbd2a7a18ded87896109d1e20b7e41cae76377bd16901fd8defa7d89225a958f2d80aa44de52d8a6533619a2fc237aaae056d971fe0f')
