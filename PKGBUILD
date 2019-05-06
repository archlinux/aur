# Maintainer: Gabriel Moura <develop@srmoura.com.br>

pkgname=retux
pkgver=1.3.6
pkgrel=0
pkgdesc="Game based on the SuperTux."
arch=('x86_64')
url="http://retux.nongnu.org/"
license=('GPL')
depends=('python')
_named="${pkgname}-${pkgver}-linux-gnu-x86_64"
source=("http://download.savannah.gnu.org/releases/retux/1.3/${_named}.tar.gz" 
    "${pkgname}.desktop")

sha512sums=('2253cd6ca604d15318a7a97038aef28ca487f68c752772efd5eb72c05f4be8838f5ec5e0f3578d8aea3797187622c0d5a2d255c3cde00e03422de2389eeb10a8'
            '1e1f55e571be598dabdb33434d56b166fcefe58168ea07ef1d23b20892b49ee2019625eb92fd265e851350d6baec91167f3b941bc6525f94500cd7dda03536d8')


package(){
    mkdir -p ${pkgdir}/usr/lib/games/${pkgname}
    mkdir -p ${pkgdir}/usr/games
    mkdir -p ${pkgdir}/usr/share/applications
    mkdir -p ${pkgdir}/usr/share/icons

    cp -pR ${srcdir}/${_named}/* ${pkgdir}/usr/lib/games/${pkgname}
    
    ln -s ../lib/games/${pkgname}/${pkgname} ${pkgdir}/usr/games/${pkgname}
    
    cp -p ${pkgdir}/usr/lib/games/${pkgname}/data/images/misc/logo.png ${pkgdir}/usr/share/icons/${pkgname}.png
    mv ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}