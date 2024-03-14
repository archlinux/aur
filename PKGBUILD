# Maintainer: Dylan Delgado <dylan1496@live.com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Vincent Grande <shoober420@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Andreas B. Wagner <andreas.wagner@lowfatcomputing.org>

pkgname=vttest
pkgver=20240218
pkgrel=1
pkgdesc="Tool for testing VT100 compatibility of terminals"
arch=(x86_64 i686)
url="https://invisible-island.net/vttest"
license=(MIT)
depends=(glibc)
source=("https://invisible-island.net/archives/vttest/vttest-${pkgver}.tgz")
sha256sums=('625b292f8052ffbbefe7d9d6fbdf9c8d1fc18b5c85568f2547097d97c540bd75')

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
