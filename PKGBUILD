# Maintainer: fuyukaidesu <mirai@kuriyama.moe>
pkgname=libmlx
pkgver=1
pkgrel=3
pkgdesc="Simple X programming API in C, designed for students, suitable for beginners"
arch=('i686' 'x86_64')
license=('BSD')
depends=('libxext' 'libbsd')
provides=('minilibx')
url="http://42.fr"
source=('https://projects.intra.42.fr/uploads/document/document/7/sources.tgz' mlx.pc)
md5sums=('SKIP' 'SKIP')

build() {
  cd "minilibx"
  make -f Makefile.gen
}

package() {
  cd "minilibx"
  mkdir -p $pkgdir/usr/include/mlx
  mkdir -p $pkgdir/usr/lib/pkgconfig
  cp libmlx.a "$pkgdir/usr/lib"
  cp ../mlx.pc "$pkgdir/usr/lib/pkgconfig"
  cp mlx.h mlx_int.h "$pkgdir/usr/include/mlx"
}
