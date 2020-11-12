# Maintainer: Michael Gisbers <michael@gisbers.de>
pkgname=flashprint
pkgver=4.5.1
pkgrel=1
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
         '13f4219e9727314e9646f0230e736242')
sha256sums=('88b014a318d25cf6b8282b02b36592e9619ceabb1fc142c58ff7b95572d3b890'
            '8d37f047b9e72f7eee1e7c21dd3eef6fb8b9d7fba94ef3b7c430fa7f6f5e89b3')
sha512sums=('b27d798528048da69e111f1c9ef1f0a15391e15529691105f728d1b5d9145390ac65858809611501f99b33740501e81ecc798ee03ba572d74fb2dc90db2c4ac8'
            '1c44983c5761fe89970beb971783c8beb118ad744570cf6a1f3b7e12184b976011eccfd7539977006181ecd09a10a571ac810f4b8920be48453d8d2847f94c36')
