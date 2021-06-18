# Maintainer: Michael Gisbers <michael@gisbers.de>
pkgname=flashprint
pkgver=4.6.4
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




md5sums=('9c31da389d0a2769c0c108ce7618d4a0'
         '03ee63ae9ca742e933abc54afa8845f7')
sha256sums=('38cfc70822aa88c05ce2e235febf24be82440cd42d288b8cb164f4f2d1a634cc'
            '5e73acdb58cd650343afc872955e0dd0204d59195fc7d6fdd435f7aa5b59868f')
sha512sums=('9884730c2b10c5e242842824b111173066f97ba939e40819e3bc00481fd1a7a7953771cec4d1c55fb8d0600b8a32bc2bba506f521de9b4edd53b79a6ba491e58'
            '46f623033d7c59220bd2f257569420d053b3c90ea61f8082324689fa4be2528f5572d00118b5f0e85e9ffbade4bc8f5ca5c574587ef83464ebf046dd332bb035')
