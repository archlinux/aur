# Maintainer:

pkgname=goonies
pkgver=1.4.1528
pkgrel=5
pkgdesc="Remake of Konami's The Goonies for the MSX"
arch=('i686' 'x86_64')
license=('unknown')
url="http://www.braingames.getput.com/goonies"
depends=('sdl_image' 'sdl_mixer' 'glu')
source=("http://braingames.jorito.net/goonies/downloads/$pkgname.src_$pkgver.tgz"
        "goonies.patch")
sha256sums=('9e9c1e67a41dfae512e975b6931828cdc82f07397921ca0a41a81c3020a73799'
            'b04dbeef39ea2ce09a00aba1f01ab30ffe42a4e57710999ebe7d2b63cb6d6d1e')

prepare() {
  cd $pkgname-$pkgver
  # fix compile errors, bin path, flags
  patch -p1 -i ../goonies.patch
}

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make PREFIX="$pkgdir"/usr install
}
