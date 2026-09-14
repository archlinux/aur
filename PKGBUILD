# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Michal Hybner <dta081@gmail.com>

pkgname=libosip2
pkgver=5.3.2
pkgrel=1
pkgdesc="An implementation of SIP"
arch=('x86_64' 'i686' 'aarch64')
url="https://www.gnu.org/software/osip"
license=('LGPL-2.1-only')
depends=(glibc)
source=("https://ftp.gnu.org/gnu/osip/libosip2-${pkgver}.tar.gz"{,.sig})
sha256sums=('16186f6f5540936b62c3aaca6e8409e1af25cd22abc3882b393be215f49d3b00' 'SKIP')
validpgpkeys=('34C3985D068879312FE23C8BB5902A3AD90A5421')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
