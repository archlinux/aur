# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=roadfighter
pkgver=1.0.1269
pkgrel=2
pkgdesc="Unofficial remake of Konami's Road Fighter for the MSX"
arch=('i686' 'x86_64')
license=('unknown')
url="http://www2.braingames.getput.com/roadf"
depends=('sdl_image' 'sdl_mixer' 'sdl_sound' 'sdl_ttf')
source=("http://braingames.jorito.net/roadfighter/downloads/$pkgname.src_$pkgver.tgz"
        "roadfighter.patch")
sha1sums=('e6cacf74065fcd27838c66b4c57998f9fdbc2874'
          '058acadfb585619ab03e63a0859c5f2659b817a3')

prepare() {
  cd $pkgname-$pkgver

  # fix compile errors and bin path
  patch -p0 < ../roadfighter.patch
}

build() {
  cd $pkgname-$pkgver

  make
}

package() {
  cd $pkgname-$pkgver

  make PREFIX="$pkgdir"/usr install
}
