# Maintainer: Julian Brost <julian@0x4a42.net>

pkgname=mkpasswd
pkgver=5.5.5
pkgrel=1
pkgdesc="Tool for creating password hashes suitable for /etc/shadow"
arch=('i686' 'x86_64')
url="https://github.com/rfc1036/whois"
license=('GPL')
depends=('glibc')
makedepends=('perl')
source=("whois-$pkgver.tar.gz::https://github.com/rfc1036/whois/archive/v$pkgver.tar.gz")
sha256sums=('8210191d397d419f2bc80ef95e35fb543a55791fa299f9eceb41ecb0a19a8d7e')

build() {
  cd "${srcdir}/whois-${pkgver}"

  make prefix=/usr CFLAGS="$CFLAGS $CPPFLAGS" mkpasswd
}

package() {
  cd "${srcdir}/whois-${pkgver}"

  make prefix=/usr BASEDIR="${pkgdir}" install-mkpasswd
}
