# Maintainer:Lucas Eduardo Wendt <lucas59356@gmail.com>

pkgname=allegro-blasteroids-git
pkgver=v1
depends=('allegro')
makedepends=('cmake')
pkgrel=0
arch=(x86_64)
pkgdesc="A game inspired on blasteroids started from the last proposed exercise of Head First C"
license=("custom")
url="https://github.com/lucasew/allegro_blasteroids"
source=("https://github.com/lucasew/allegro_blasteroids/archive/$pkgver.zip")

sha256sums=("040b6eaa2a4f2314f18a9cb10ae72db5e31b4771d2adaa496aa8805f08077d9d")

package() {
    ORIGIN=$srcdir/allegro_blasteroids-1
    DESTINATION=$pkgdir/opt/allegro-blasteroids
    mkdir -p $DESTINATION
    mkdir -p $pkgdir/usr/share/applications
    cmake $ORIGIN -DCMAKE_BUILD_TYPE=Release
    echo "Disabling verbose code..."
    cp ../config.h $ORIGIN/include/blasteroids
    make
    cp game $DESTINATION
    cp font.ttf $DESTINATION
    cp ../AllegroBlasteroids.desktop $pkgdir/usr/share/applications
}
