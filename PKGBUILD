# Maintainer: envolution
# Contributor: Dylan Delgado <dylan1496@live.com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Vincent Grande <shoober420@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Andreas B. Wagner <andreas.wagner@lowfatcomputing.org>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=vttest
pkgver=20251205
pkgrel=1
pkgdesc="Tool for testing VT100 compatibility of terminals"
arch=(x86_64 i686)
url="https://invisible-island.net/vttest"
license=(MIT)
depends=(glibc)
source=("https://invisible-island.net/archives/vttest/vttest-${pkgver}.tgz")
sha256sums=('cd6886f9aefe6a3f6c566fa61271a55710901a71849c630bf5376aa984bf77cc')

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
