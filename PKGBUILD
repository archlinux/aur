# Maintainer: Michael Gisbers <michael@gisbers.de>
pkgname=flashprint
pkgver=4.5.1
pkgrel=2
pkgdesc="Slicer for the FlashForge 3D printers."
arch=('x86_64')
url="http://www.ff3dp.com/"
depends=('qt5-base')
license=('custom')
source=("${pkgname}-${pkgver}_amd64.deb::https://en.fss.flashforge.com/10000/software/361aa4e2603599ff099e83c8c95f2426.deb" "${pkgname}")


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




md5sums=('c8f199088c8d35e1c77bd562e47f259b'
         '03ee63ae9ca742e933abc54afa8845f7')
sha256sums=('88b014a318d25cf6b8282b02b36592e9619ceabb1fc142c58ff7b95572d3b890'
            '5e73acdb58cd650343afc872955e0dd0204d59195fc7d6fdd435f7aa5b59868f')
sha512sums=('b27d798528048da69e111f1c9ef1f0a15391e15529691105f728d1b5d9145390ac65858809611501f99b33740501e81ecc798ee03ba572d74fb2dc90db2c4ac8'
            '46f623033d7c59220bd2f257569420d053b3c90ea61f8082324689fa4be2528f5572d00118b5f0e85e9ffbade4bc8f5ca5c574587ef83464ebf046dd332bb035')
