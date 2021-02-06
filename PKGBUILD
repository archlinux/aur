# Maintainer: Michael Gisbers <michael@gisbers.de>
pkgname=flashprint
pkgver=4.6.2
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




md5sums=('720828a7426aea85b643a8159b4d1264'
         '03ee63ae9ca742e933abc54afa8845f7')
sha256sums=('add5bdcef445d3fef03951f2b8aec28230b5a34dd517a41b23fb93f40580e432'
            '5e73acdb58cd650343afc872955e0dd0204d59195fc7d6fdd435f7aa5b59868f')
sha512sums=('9262d13b0ae0a40ed8d50e781e0322c2c80c2f672001a528730cf38e8d8b543d2d5e5135085346ab6b6112f4a9b9e37f5f0da9df227fd10a966ba9d0d9ca952d'
            '46f623033d7c59220bd2f257569420d053b3c90ea61f8082324689fa4be2528f5572d00118b5f0e85e9ffbade4bc8f5ca5c574587ef83464ebf046dd332bb035')
