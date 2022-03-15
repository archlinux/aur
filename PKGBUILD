# Maintainer: Jakub Jirutka <jakub@jirutka.cz>

pkgname=zzz
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple program to suspend or hibernate your computer"
arch=(any)
url="https://github.com/jirutka/zzz"
license=(MIT)
makedepends=(asciidoctor)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jirutka/zzz/archive/v$pkgver.tar.gz")
sha256sums=('7d3d1267bc97e4fd478012d6eb3a3d836853daa45cf8dc280049256cab5e44d9')

build() {
  cd $pkgname-$pkgver
  make CFLAGS="$CFLAGS -DZZZ_LOCK_FILE='\"/run/zzz.lock\"'"
}

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="$pkgdir" prefix=/usr
}
