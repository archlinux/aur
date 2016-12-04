# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=f1spirit
pkgver=0.rc9.1615
pkgrel=2
pkgdesc="Classic MSX race game remade by Brain Games"
arch=('i686' 'x86_64')
license=('unknown')
url="http://www.braingames.getput.com/f1spirit"
depends=('sdl_image' 'sdl_mixer' 'sdl_net' 'glu' 'curl')
source=("http://braingames.jorito.net/f1spirit/f1spirit.src_0.rc9-1615.tgz"
        "f1spirit.patch")
sha1sums=('90a6a0a3b5f7dc18a3497d32bb580bf47e688c95'
          'c718f3e0bab5b47a4305a3acd95bef3fd67391a2')

prepare() {
  cd $pkgname-$pkgver

  # fix compile errors and bin path
  patch -p0 < ../f1spirit.patch
}

build() {
  cd $pkgname-$pkgver

  make
}

package() {
  cd $pkgname-$pkgver

  make PREFIX="$pkgdir"/usr install
}
