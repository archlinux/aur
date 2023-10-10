# Maintainer: Dylan Delgado <dylan1496@live.com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Vincent Grande <shoober420@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Andreas B. Wagner <andreas.wagner@lowfatcomputing.org>

pkgname=vttest
pkgver=20230924
pkgrel=1
pkgdesc="Tool for testing VT100 compatibility of terminals"
arch=(x86_64 i686)
url="https://invisible-island.net/vttest"
license=(MIT)
depends=(glibc)
source=("https://invisible-island.net/archives/vttest/vttest-${pkgver}.tgz")
sha256sums=('be8b07cb590976d1f42af8597ddadac808d08b0a268bb6304a887dab3f13a228')

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
