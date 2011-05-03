# Maintainer: Adrian Perez <aperez@igalia.com>
pkgname=dmon
pkgver=0.3.7
pkgrel=1
pkgdesc="Toolset for daemonizing and supervising processes"
arch=(i686 x86_64)
url="http://gitorious.org/dmon"
license=(MIT)
depends=(glibc)
makedepends=(make)
source=(http://furi-ku.org/+/cgit/code/dmon/snapshot/${pkgname}-${pkgver}.tar.gz)
md5sums=(84274ef9cfbc2cca827e0b8e19b6d35e)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make MULTICALL=1 prefix=/usr
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make MULTICALL=1 prefix=/usr DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
