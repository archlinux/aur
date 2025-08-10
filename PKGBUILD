# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=cstat
pkgver=0.9.9
pkgrel=2
pkgdesc="A tool to gather real-time statistics from Cube and Cube 2 game servers"
arch=(i686 x86_64)
url=https://sourceforge.net/projects/cubestat
license=(GPL-2.0-only)
depends=(glibc curl)
source=(https://downloads.sourceforge.net/project/cubestat/$pkgname-$pkgver-src.tar.gz)
sha256sums=('f6ee722f95b2c2c367ca7516cf305bdbf15069cbea79e0b61a3a8b6d17cefeba')

build() {
  cd $pkgname-$pkgver-src/src

  export CFLAGS+=" -I. -DHAVE_CONFIG_H"

  ./configure --prefix=/usr
  make
}

package() {
  install -Dm755 $pkgname-$pkgver-src/src/$pkgname -t "$pkgdir/usr/bin"
}
