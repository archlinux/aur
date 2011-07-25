# Maintainer: Adrian Perez <aperez@igalia.com>
pkgname=dmon
pkgver=0.4.1
pkgrel=1
pkgdesc="Toolset for daemonizing and supervising processes"
arch=(i386 x86_64)
url="http://gitorious.org/dmon"
license=(MIT)
depends=(glibc)
makedepends=(make)
source=(http://people.igalia.com/aperez/files/${pkgname}-${pkgver}.tar.gz)
md5sums=(c9fb6c34211ec9941b43d51b88c9cc18)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make MULTICALL=1 prefix=/usr
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make MULTICALL=1 prefix=/usr DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
