# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=goonies
pkgver=1.4.1528
pkgrel=2
pkgdesc="Unofficial remake of Konami's The Goonies for the MSX"
arch=('i686' 'x86_64')
license=('unknown')
url="http://www.braingames.getput.com/goonies"
depends=('sdl_image' 'sdl_mixer' 'glu')
source=("http://braingames.jorito.net/goonies/downloads/$pkgname.src_$pkgver.tgz"
        goonies.patch)
sha1sums=('a2be53b74e9744ca72fdd1913f2dab1912170534'
          '931f5b2effc39324d60c5ea3d344b21ceaad7fcf')

prepare() {
  cd $pkgname-$pkgver

  # fix compile errors and bin path
  patch -p0 < ../goonies.patch
}

build() {
  cd $pkgname-$pkgver

  make
}

package() {
  cd $pkgname-$pkgver

  make PREFIX="$pkgdir"/usr install
}
