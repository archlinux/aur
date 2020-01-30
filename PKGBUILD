# Maintainer: xunhua.guo <xunhua.guo@gmail.com>
# Contributor: Ben <ben@ported.pw>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: royrocks <royrocks13@gmail.com>

pkgname=cups-bjnp
pkgver=2.0.2
pkgrel=1
pkgdesc='CUPS back-end for the canon printers using the proprietary USB over IP BJNP protocol'
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/cups-bjnp/'
license=('GPL')
depends=('libcups')
makedepends=('cups')
source=("http://downloads.sourceforge.net/sourceforge/cups-bjnp/cups-bjnp-${pkgver}.tar.gz")
sha256sums=('586a8e0b2e92d41e85e981a16e3015a240f11a02b1bbbd0b92cd45620f411b0e')

build() {
  cd cups-bjnp-${pkgver}

  # Patch for https://gcc.gnu.org/onlinedocs/gcc-8.1.0/gcc/Warning-Options.html#index-Wstringop_002dtruncation
  # sed -i 's/strncpy/memcpy/' bjnp-commands.c

  ./configure --prefix='/usr'
  make
}

package() {
  cd cups-bjnp-${pkgver}

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
