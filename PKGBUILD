# Maintainer: Mark Stenglein <aur@markstenglein.com>
name=lovers-in-a-dangerous-spacetime
pkgname=$name-bin
pkgver=1.4.5
pkgrel=2
pkgdesc="Explore a neon galaxy in your very own battleship in Lovers in a Dangerous Spacetime, a thrilling 1- to 4-player couch co-op adventure."
arch=("x86_64")
url="https://www.loversinadangerousspacetime.com/"
license=('nonfree')
makedepends=()
depends=('gtk2'
         'gdk-pixbuf2'
         'glib2'
         'libxcursor'
         'libxrandr')
conflicts=('lovers-in-a-dangerous-spacetime')
changelog='CHANGELOG.md'
source=("local://LoversInADangerousSpacetime-${pkgver}_Linux.zip"
        "com.loversinadangerousspacetime.LoversInADangerousSpacetime.desktop"
        "lovers-in-a-dangerous-spacetime.png")
sha256sums=('67dbe65e9da012c87bff1c18320ff267de817847ce89815f944507fd9afad4ea'
            '89e4e7cd7874bf7f36474246e98f410426e7d50f0e5365b01e016d767460b79a'
            'f9d5e4279d1163714f5e15a2355f00c5a187b7c76f031440d0989ceb3c0388f3')

package() {
    mkdir -p $pkgdir/opt/$name
    cp -r LoversInADangerousSpacetime_Data $pkgdir/opt/$name/
    install -Dm755 LoversInADangerousSpacetime.x86_64 $pkgdir/opt/$name/
    install -Dm755 LoversInADangerousSpacetime.x86 $pkgdir/opt/$name/
    install -Dm644 lovers-in-a-dangerous-spacetime.png $pkgdir/usr/share/pixmaps/lovers-in-a-dangerous-spacetime.png
    install -Dm644 com.loversinadangerousspacetime.LoversInADangerousSpacetime.desktop $pkgdir/usr/share/applications/com.loversinadangerousspacetime.LoversInADangerousSpacetime.desktop
}
