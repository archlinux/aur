# Maintainer: Michael Straube <michael_straube web de>

pkgname=goonies
pkgver=1.4.1528
pkgrel=1
pkgdesc="Unofficial remake of Konami's The Goonies for the MSX"
arch=('i686' 'x86_64')
license=('unknown')
url="http://www.braingames.getput.com/goonies"
depends=('sdl_image' 'sdl_mixer' 'glu')
source=("http://braingames.jorito.net/goonies/downloads/$pkgname.src_$pkgver.tgz"
        goonies.patch)
sha1sums=('a2be53b74e9744ca72fdd1913f2dab1912170534'
          '780e4bacf811b63431718f24e33e799f017bf726')

prepare() {
  cd $pkgname-$pkgver

  # fix compile errors and bin path
  patch -p0 < "$srcdir/goonies.patch"
}

build() {
  cd $pkgname-$pkgver

  make
}

package() {
  cd $pkgname-$pkgver

  make PREFIX="$pkgdir/usr" install
}
