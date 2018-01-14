# Maintainer:

pkgname=roadfighter
pkgver=1.0.1269
pkgrel=5
pkgdesc="Unofficial remake of Konami's Road Fighter for the MSX"
arch=('i686' 'x86_64')
license=('unknown')
url="http://www2.braingames.getput.com/roadf"
depends=('sdl_image' 'sdl_mixer' 'sdl_sound' 'sdl_ttf')
source=("http://braingames.jorito.net/roadfighter/downloads/$pkgname.src_$pkgver.tgz"
        "roadfighter.patch")
sha256sums=('c6ed315c4b2bf25d598ffa6b5dfd471e7f187ff29b86fd3213054fb6be7c57e7'
            '8eb4ffcd80575e03d058bae311cc6a43bd79582fcd75f84e35ae176ea4c31d06')

prepare() {
  cd $pkgname-$pkgver
  # fix compile errors, bin path, flags
  patch -p1 -i ../roadfighter.patch
}

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make PREFIX="$pkgdir"/usr install
}
