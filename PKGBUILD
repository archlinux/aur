# Maintainer: Julian Brost <julian@0x4a42.net>

pkgname=mkpasswd
pkgver=5.4.3
pkgrel=1
pkgdesc="Tool for creating password hashes suitable for /etc/shadow"
arch=('i686' 'x86_64')
url="https://github.com/rfc1036/whois"
license=('GPL')
depends=('glibc')
makedepends=('perl')
source=("whois-$pkgver.tar.gz::https://github.com/rfc1036/whois/archive/v$pkgver.tar.gz")
sha256sums=('2c2de92407ce925c270246e141234ab6fc6f7894d81b3b8a23e8c80b6a6c334c')

build() {
  cd "${srcdir}/whois-${pkgver}"

  make prefix=/usr CFLAGS="$CFLAGS $CPPFLAGS" mkpasswd
}

package() {
  cd "${srcdir}/whois-${pkgver}"

  make prefix=/usr BASEDIR="${pkgdir}" install-mkpasswd
}
