# Maintainer: Flávio Tapajós <flavio dot pereira at usp dot br>
# Contributor: Simone Scalabrino <s dot scalabrino 9 at gmail dot com>

webappname=pocket
pkgname=${webappname}-qdesktop
pkgver=0.2
pkgrel=1
pkgdesc='Get pocket web-app based on qtws'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qtws-base')
source=("$webappname.qtws" "$webappname.svg" "$webappname.desktop" "$webappname")
md5sums=('e0d1dd7a682513f61779e977d115051c'
         '3f96abae2159da1a336e1a586340f1a4'
         'fbf07eed4578ed53ac2f42041064f754'
         '3a40745ef959b039abc55c6a592a7232')

package() {
    mkdir -p ${pkgdir}/usr/share/qtws-apps/$webappname
    echo ${srcdir}
    
    install -Dm644 ${srcdir}/$webappname.qtws ${pkgdir}/usr/share/qtws-apps/$webappname/$webappname.qtws
    install -Dm755 ${srcdir}/$webappname.desktop ${pkgdir}/usr/share/applications/$webappname-desktop.desktop
    install -Dm644 ${srcdir}/$webappname.svg ${pkgdir}/usr/share/pixmaps/$webappname-desktop.svg
    install -Dm755 ${srcdir}/$webappname ${pkgdir}/usr/bin/$webappname
}