# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=libgtpnl
pkgver=1.3.2
pkgrel=1
pkgdesc="netlink library for Linux kernel GTP code"
url="https://osmocom.org/projects/linux-kernel-gtp-u/wiki/Libgtpnl"
arch=('x86_64')
license=('LGPL-2.1-only')
depends=('libmnl')
conflicts=("${pkgname}-git")
provides=('libgtpnl.so=0-64')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('28b46cd8efbf9bc056d05256ca657b4e0234f5c59ec92f5e8d8ff4ec21a97c76')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --libdir=/usr/lib/ \
              --libexecdir=/usr/lib
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
