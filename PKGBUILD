# Maintainer: yiranzai <wuqingdzx@gmail.com>
pkgname=navicat121_premium_en_x64
pkgver=12.1.12
pkgrel=1
pkgdesc="Navicat Premium is a multi-connection database development tool."
url="http://www.navicat.com"
license=('GPL3')
arch=('any')
provides=('navicat')
depends=('wine')
source=(http://dn.navicat.com/download/navicat121_premium_en_x64.tar.gz
        navicat.desktop
        navicat
        Navicat_Premium.png)
    
md5sums=('SKIP'
         '0b9b9533ac454b9ee8ad49e6e487bbfd'
         '20fa59790eb7acaeeeaf4b86cdd0551f'
         '595f2ae611d7ebb183e83d712232b0e2')

package() {
    mkdir -p ${pkgdir}/opt/navicat
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/share/applications
    cp -R ${srcdir}/navicat121_premium_en_x64/* ${pkgdir}/opt/navicat/
    cp ${srcdir}/navicat ${pkgdir}/usr/bin/
    chmod +x ${pkgdir}/usr/bin/navicat
    install -Dm644 "navicat.desktop" "${pkgdir}/usr/share/applications/navicat.desktop"
    install -Dm644 "Navicat_Premium.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/Navicat_Premium.png"
}
