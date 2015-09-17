pkgname=cal3d
pkgver=0.11.0
pkgrel=6
pkgdesc="A skeletal-based 3D character animation library"
arch=(i686 x86_64)
url="https://gna.org/projects/cal3d"
options=(!libtool)
license=(GPL2)
depends=('gcc-libs')
makedepends=('patch')
source=(http://download.gna.org/cal3d/sources/cal3d-$pkgver.tar.gz cal3d-gcc43.diff)
md5sums=('82ad09c1c28e73bc9596aec47237bfba'
         'f290fb54f844e044ae80165f083cf58f')
build() {
  cd "${pkgname}-$pkgver"
  patch -p0 < ../cal3d-gcc43.diff
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-$pkgver"
  make DESTDIR=${pkgdir} install
}
