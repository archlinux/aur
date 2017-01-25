# Maintainer: archlinux.info:tdy

pkgname=sjeng
pkgver=11.2
pkgrel=1
pkgdesc="An XBoard chess engine including a text-based interface and variant support (standard, bughouse, crazyhouse, antichess, losers)"
arch=(i686 x86_64)
url=https://sjeng.org
license=(GPL)
depends=(gdbm)
source=(https://$pkgname.org/ftp/Sjeng-Free-$pkgver.tar.gz)
sha256sums=(aaf584d12e79f8e366710d40cc02a27a7927dd924234421107b2fb8e84cfd727)

build() {
  cd Sjeng-Free-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd Sjeng-Free-$pkgver
  make DESTDIR="$pkgdir" install
}
