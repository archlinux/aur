# Maintainer: Michael Gisbers <michael@gisbers.de>
pkgname=flashprint
pkgver=4.6.0
pkgrel=1
pkgdesc="Slicer for the FlashForge 3D printers."
arch=('x86_64')
url="http://www.ff3dp.com/"
depends=('qt5-base')
license=('custom')
source=("${pkgname}-${pkgver}_amd64.deb::http://www.ishare3d.com/3dapp/public/FlashPrint-ii/FlashPrint/flashprint_4.6.0_amd64.deb" "${pkgname}")


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




md5sums=('09e751fe9c46aaddad21a663cb532795'
         '03ee63ae9ca742e933abc54afa8845f7')
sha256sums=('d8081bb2045b4f35d19849f358ed8e85d3498b0baec609b7b0fbc7273608811b'
            '5e73acdb58cd650343afc872955e0dd0204d59195fc7d6fdd435f7aa5b59868f')
sha512sums=('8afe5b5ec4340256b6ac86c3ad5dffeb15cc8b0ec11fb398176ad122f74dda431feabf7c4fad396526047d04a94e64a37740ee111594b79e10fba640794d3786'
            '46f623033d7c59220bd2f257569420d053b3c90ea61f8082324689fa4be2528f5572d00118b5f0e85e9ffbade4bc8f5ca5c574587ef83464ebf046dd332bb035')
