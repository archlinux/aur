# Maintainer: OscarOrSomething <oscar.shrimpton.personal@gmail.com>
pkgname=grappl
pkgver=latest
pkgrel=24
pkgdesc="grappl is a clever little tool that lets you host any type of server anywhere for free, with no port forwarding and no VPS.
Your router doesn't even have to support uPnP. You don't even have to have a router. You can do it through your phone!"
arch=(any)
license=('GNU LESSER GENERAL PUBLIC LICENSE V2.1')
url="http://www.grappl.io/"
depends=('java-runtime' 'xorg-xrandr' 'ttf-font' 'libxtst')
noextract=('GrapplLauncher.jar')
source=(grappl http://grappl.io:888/html/GrapplLauncher.jar
         grappl.desktop LICENSE)
md5sums=('0444a7ce5951bea43fe4eabe005f06a0'
                  'b4bc164aa18db8354a987df00f93fe62'
                  '89fa4b959482d90728302fdefdef21e4'
                  '7d93f005407dc76be53fc76ab46e05d0')

package() {
    cd "$srcdir"

    install -D -m755 "${srcdir}/grappl"         "${pkgdir}/usr/bin/grappl"
    install -D -m644 "${srcdir}/GrapplLauncher.jar"     "${pkgdir}/usr/share/grappl/GrapplLauncher.jar"

    # Desktop launcher with icon
    install -D -m644 "${srcdir}/grappl.desktop" "${pkgdir}/usr/share/applications/grappl.desktop"

    # License
    install -D -m644 "${srcdir}/LICENSE"           "${pkgdir}/usr/share/licenses/grappl/LICENSE"
}
