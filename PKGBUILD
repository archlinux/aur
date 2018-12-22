# Maintainer:Lucas Eduardo Wendt <lucas59356@gmail.com>

pkgname=allegro-blasteroids-git
pkgver=v1.1
depends=('allegro')
makedepends=('cmake')
pkgrel=0
arch=(x86_64)
pkgdesc="A game inspired on blasteroids started from the last proposed exercise of Head First C"
license=("custom")
options=(!strip)
url="https://github.com/lucasew/allegro_blasteroids"
source=("https://github.com/lucasew/allegro_blasteroids/archive/$pkgver.zip")

sha256sums=("b1cf5027ce83a78f3f301fa0ce6bde76e243fdedcee8d674f7463091c255d6a6")

package() {
    ORIGIN=$srcdir/allegro_blasteroids-1.1
    DESTINATION=$pkgdir/opt/allegro-blasteroids
    mkdir -p $DESTINATION
    mkdir -p $pkgdir/usr/share/applications
    cmake $ORIGIN
    echo "Disabling verbose code..."
    cp ../config.h $ORIGIN/include/blasteroids
    make
    cp blasteroids $DESTINATION
    cp blasteroids_font.ttf $DESTINATION
    cp ../AllegroBlasteroids.desktop $pkgdir/usr/share/applications
}
