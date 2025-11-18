# Maintainer: Doridian <archlinux at doridian dot net>

pkgname=open-cobol-esql
pkgver=1.4
pkgrel=3
pkgdesc='Embedded SQL pre-compiler and run-time library designed for COBOL applications which access an open-source database.'
arch=('x86_64' 'aarch64')
url='https://github.com/opensourcecobol/Open-COBOL-ESQL'
license=('GPL-3.0-or-later' 'LGPL-3.0-or-later')
makedepends=('gcc' 'postgresql-libs' 'autoconf' 'automake')
depends=('postgresql-libs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('de921189708c24b0859f9e2a82b34d74b242df469302f53de30d7e8e4c24d18a5a4c64abd645add546429a9fdb659982b1a759a24692e58b33148c3cd08c4698')

_pkgsrcdir="Open-COBOL-ESQL-${pkgver}"

build() {
  cd "${srcdir}/${_pkgsrcdir}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgsrcdir}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
