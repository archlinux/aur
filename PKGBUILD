# Maintainer: Thibault Mondary <thibm@free.fr>
# Maintainer: Simone Sclavi 'Ito' <darkhado@gmail.com>

pkgname=crack-attack-sounds
__pkgalias=crack-attack
pkgver=1.1.14
pkgrel=4
__patch=21
__fc=fc18
pkgdesc="Sound effects and music for crack-attack, taken from the Fedora's package"
arch=('any')
url="https://admin.fedoraproject.org/community/?package=crack-attack#package_maintenance/package_overview"
license=('GPL' 'custom:Crystal Stacker freeware')
depends=('crack-attack')
source=(http://kojipkgs.fedoraproject.org/packages/${__pkgalias}/${pkgver}/${__patch}.${__fc}/src/${__pkgalias}-${pkgver}-${__patch}.${__fc}.src.rpm)
md5sums=('ac74099929159634a2c58a4a7a59fe73')
package() {
    mkdir -p $pkgdir/usr/share/crack-attack
    
    bsdtar -zxf crack-attack-music.tar.gz
    cp -r music $pkgdir/usr/share/crack-attack
    install -Dm644 music-sound-copyright.txt $pkgdir/usr/share/licenses/${pkgname}/music-sound-copyright.txt
    
    bsdtar -zxf crack-attack-sounds.tar.gz
    cp -r data/sounds $pkgdir/usr/share/crack-attack
}



