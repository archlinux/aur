# Maintainer: Jakub Jirutka <jakub@jirutka.cz>

pkgname=zzz
pkgver=0.1.1
pkgrel=3
pkgdesc="A simple program to suspend or hibernate your computer"
arch=(any)
url="https://github.com/jirutka/zzz"
license=(MIT)
makedepends=(asciidoctor)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jirutka/zzz/archive/v$pkgver.tar.gz")
sha256sums=('e52d316f85e9ad9fc35ad0b68b9dfc56740d473a859442b6a9d898198135605c')

build() {
  cd $pkgname-$pkgver
  make CFLAGS="$CFLAGS -DZZZ_LOCK_FILE='\"/run/zzz.lock\"'"
}

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="$pkgdir" prefix=/usr sbindir=/usr/bin
}
