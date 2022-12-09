# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Vincent Grande <shoober420@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Andreas B. Wagner <andreas.wagner@lowfatcomputing.org>

pkgname=vttest
pkgver=20221111
pkgrel=1
pkgdesc="Tool for testing VT100 compatibility of terminals"
arch=(x86_64 i686)
url="https://invisible-island.net/vttest"
license=(MIT)
depends=(glibc)
source=("https://invisible-island.net/archives/vttest/vttest-${pkgver}.tgz")
sha256sums=('6ac0bf66a58073780fdeb7463114f51d80b1cc9e8ef1d8c7363053fcdc3181a7')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  make DESTDIR=$pkgdir mandir="/usr/share/man" install
}
