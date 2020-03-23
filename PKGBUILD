# Maintainer: Michael Gisbers <michael@gisbers.de>
pkgname=flashprint
pkgver=4.2.0
pkgrel=2
pkgdesc="Slicer for the FlashForge 3D printers."
arch=('x86_64')
url="http://www.ff3dp.com/"
depends=('qt5-base' 'qt5-base-595')
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
         '13f4219e9727314e9646f0230e736242')
sha256sums=('cfb61ebf6ddfd330cae14f02e39d3e6ce69c57eac0d404ef8cbdca2eb7e0e373'
            '8d37f047b9e72f7eee1e7c21dd3eef6fb8b9d7fba94ef3b7c430fa7f6f5e89b3')
sha512sums=('86584d5b12ea5c613f49d25d5207b1ce61bf7ff88f41d19671442ffe4980b06b5877aae6be2b4578ec70408daa928802c48add22729b0c037e2638566f708279'
            '1c44983c5761fe89970beb971783c8beb118ad744570cf6a1f3b7e12184b976011eccfd7539977006181ecd09a10a571ac810f4b8920be48453d8d2847f94c36')
