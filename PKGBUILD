# Maintainer: Michael Straube <michael_straube web de>

pkgname=roadfighter
pkgver=1.0.1269
pkgrel=1
pkgdesc="Unofficial remake of Konami's Road Fighter for the MSX"
arch=('i686' 'x86_64')
license=('unknown')
url="http://www2.braingames.getput.com/roadf"
depends=('sdl_image' 'sdl_mixer' 'sdl_sound' 'sdl_ttf')
source=("http://braingames.jorito.net/roadfighter/downloads/$pkgname.src_$pkgver.tgz"
        "roadfighter.patch")
sha1sums=('e6cacf74065fcd27838c66b4c57998f9fdbc2874'
          '3b242bf8677a23378aee8e2ea06f77810db0d4c6')

prepare() {
  cd $pkgname-$pkgver

  # fix compile errors and bin path
  patch -p0 < "$srcdir/roadfighter.patch"
}

build() {
  cd $pkgname-$pkgver

  make
}

package() {
  cd $pkgname-$pkgver

  make PREFIX="$pkgdir/usr" install
}
