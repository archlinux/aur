# Maintainer: Michael Straube <michael_straube web de>

pkgname=f1spirit
pkgver=0.rc9.1615
pkgrel=1
pkgdesc="Unofficial remake of Konami's F-1 Spirit for the MSX"
arch=('i686' 'x86_64')
license=('unknown')
url="http://www.braingames.getput.com/f1spirit"
depends=('sdl_image' 'sdl_mixer' 'sdl_net' 'glu' 'curl')
source=("http://braingames.jorito.net/f1spirit/f1spirit.src_0.rc9-1615.tgz"
        "f1spirit.patch")
sha1sums=('90a6a0a3b5f7dc18a3497d32bb580bf47e688c95'
          'a7e262034860818b9cc0533d281eced6d764c1f3')

prepare() {
  cd $pkgname-$pkgver

  # fix compile errors and bin path
  patch -p0 < "$srcdir/f1spirit.patch"
}

build() {
  cd $pkgname-$pkgver

  make
}

package() {
  cd $pkgname-$pkgver

  make PREFIX="$pkgdir/usr" install
}
