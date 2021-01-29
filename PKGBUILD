# Maintainer: Michael Gisbers <michael@gisbers.de>
pkgname=flashprint
pkgver=4.6.1
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




md5sums=('d4e436365cc36f3a514973dc5754c948'
         '03ee63ae9ca742e933abc54afa8845f7')
sha256sums=('e7afc1d96ddc2dd42ff74ed9a684399518a8d9f24b12a4660129b8cf672d3f8b'
            '5e73acdb58cd650343afc872955e0dd0204d59195fc7d6fdd435f7aa5b59868f')
sha512sums=('60ab9715f3804ecd4124c9e4ca96a46ba78b606b9a26effa0ef1d8c3037f706311bc6cac647c83abe2c99bd195616531ef649309e64a53033348345358f42854'
            '46f623033d7c59220bd2f257569420d053b3c90ea61f8082324689fa4be2528f5572d00118b5f0e85e9ffbade4bc8f5ca5c574587ef83464ebf046dd332bb035')
