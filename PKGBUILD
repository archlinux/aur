# Maintainer: Julian Brost <julian@0x4a42.net>

pkgname=mkpasswd
pkgver=5.5.10
pkgrel=1
pkgdesc="Tool for creating password hashes suitable for /etc/shadow"
arch=('i686' 'x86_64')
url="https://github.com/rfc1036/whois"
license=('GPL')
depends=('glibc' 'libxcrypt')
makedepends=('perl')
source=("whois-$pkgver.tar.gz::https://github.com/rfc1036/whois/archive/v$pkgver.tar.gz")
sha256sums=('982c755210b3ff3048fb196456147844c04ad8f47646e0622117f8ce11391e81')

build() {
  cd "${srcdir}/whois-${pkgver}"

  make prefix=/usr CFLAGS="$CFLAGS $CPPFLAGS" mkpasswd
}

package() {
  cd "${srcdir}/whois-${pkgver}"

  make prefix=/usr BASEDIR="${pkgdir}" install-mkpasswd
}
