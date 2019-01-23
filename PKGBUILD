# Maintainer: Flávio Tapajós <flavio dot pereira at usp dot br>
# Maintainer: Simone Scalabrino <s dot scalabrino 9 at gmail dot com>

webappname=pocket
pkgname=${webappname}-qdesktop
pkgver=0.1
pkgrel=1
pkgdesc='Get pocket web-app based on qtws'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qtws-base')
source=("$webappname.qtws" "$webappname.svg" "$webappname.desktop" "$webappname")
md5sums=('d8680788badee8f5171773941caaf516'
         '3f96abae2159da1a336e1a586340f1a4'
         'a30b4df5389d1e5e8c984173d780ed5c'
         'b8e272f5aa2d74414dc840919f474758')


package() {
    mkdir -p ${pkgdir}/usr/share/qtws-apps/$webappname
    echo ${srcdir}
    
    install -Dm644 ${srcdir}/$webappname.qtws ${pkgdir}/usr/share/qtws-apps/$webappname/$webappname.qtws
    install -Dm755 ${srcdir}/$webappname.desktop ${pkgdir}/usr/share/applications/$webappname-desktop.desktop
    install -Dm644 ${srcdir}/$webappname.svg ${pkgdir}/usr/share/pixmaps/$webappname-desktop.svg
    install -Dm755 ${srcdir}/$webappname ${pkgdir}/usr/bin/$webappname
}
 
