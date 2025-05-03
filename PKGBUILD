# Maintainer: envolution
# Contributor: Dylan Delgado <dylan1496@live.com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Vincent Grande <shoober420@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Andreas B. Wagner <andreas.wagner@lowfatcomputing.org>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=vttest
pkgver=20241208
pkgrel=1
pkgdesc="Tool for testing VT100 compatibility of terminals"
arch=(x86_64 i686)
url="https://invisible-island.net/vttest"
license=(MIT)
depends=(glibc)
source=("https://invisible-island.net/archives/vttest/vttest-${pkgver}.tgz")
sha256sums=('8fee3bac7e87d4aa4a217bd2b38ab9910c3b8cf9a605b450c76ccc0ad2a6519d')

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
# vim:set ts=2 sw=2 et:
