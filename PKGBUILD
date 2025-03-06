# Maintainer: Martin Fritzsche <aur at mafri dot org>
# Contributor: Eric DeStefano <eric at ericdestefano dot com>
# Co-Maintainer: Fermín Olaiz <ferminolaiz at gmail dot com>

# Todo:
# - I haven't found Peter's key in any common keyserver, but there are PGP signatures available.

pkgname=prips
pkgver=1.2.0
pkgrel=1
pkgdesc="Prints IP subnet ranges by list or CIDR"
arch=('x86_64')
url="https://devel.ringlet.net/sysutils/${pkgname}/"
license=('GPL')
# See also https://packages.debian.org/stable/net/prips
source=("https://devel.ringlet.net/files/sys/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('de28d8a5a619a30d0b3c8a76f9c09c3529d197f3e74b04c8aa994096ab8349d4')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 prips "$pkgdir/usr/bin/prips"
  install -Dm644 prips.h "$pkgdir/usr/include/prips.h"
}

# vim:set ts=2 sw=2 et:
