pkgname=enemy-territory-etpro
pkgver=3.2.6
pkgrel=3
pkgdesc="Wolfenstein: Enemy Territory is a completely free, standalone, team-based, multiplayer FPS (etpro mod)"
url="http://etpro.anime.net"
license=("custom")
arch=('i686' 'x86_64')
depends=('enemy-territory')
source=("http://etpro.anime.net/etpro-3_2_6.zip"
        "et-pro.sh"
        "et-proded.sh"
        "et-pro.desktop")
md5sums=('5c2c8f56731a9ad6774e624f4e793e22'
         '5b8d10218eca6dfeba6c20b1d61c0b5f'
         'c26873275f6a119b05a4fc8424ecc28d'
         '6e8607214e9bdb10458e46c0aec8da0c')

package() {
    chown root:root -R *

    mkdir -p $pkgdir/usr/share/enemy-territory/ $pkgdir/usr/bin
    mv etpro $pkgdir/usr/share/enemy-territory/
    install -D -m 755 et-pro.sh $pkgdir/usr/share/enemy-territory/etpro
    install -D -m 755 et-proded.sh $pkgdir/usr/share/enemy-territory/etpro
    install -D -m 644 et-pro.desktop $pkgdir/usr/share/applications/et-pro.desktop
    ln -sf /usr/share/enemy-territory/etpro/{et-pro,et-proded} $pkgdir/usr/bin
}
