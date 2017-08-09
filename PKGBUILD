# Maintainer: Julian Brost <julian@0x4a42.net>

pkgname=mkpasswd
pkgver=5.2.17
pkgrel=1
pkgdesc="Tool for creating password hashes suitable for /etc/shadow"
arch=('i686' 'x86_64')
url="https://github.com/rfc1036/whois"
license=('GPL')
depends=('glibc')
makedepends=('perl')
source=("whois-$pkgver.tar.gz::https://github.com/rfc1036/whois/archive/v5.2.17.tar.gz")
sha256sums=('c3c47b139bafc4348d6794a0cca311e3adfb4aae0597f1279faa73b749ecf0d2')

build() {
  cd "${srcdir}/whois-${pkgver}"

  make prefix=/usr CFLAGS="$CFLAGS $CPPFLAGS"
}

package() {
  cd "${srcdir}/whois-${pkgver}"

  make prefix=/usr BASEDIR="${pkgdir}" install-mkpasswd
}
