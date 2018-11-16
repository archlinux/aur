# Maintainer: Julian Brost <julian@0x4a42.net>

pkgname=mkpasswd
pkgver=5.4.0
pkgrel=1
pkgdesc="Tool for creating password hashes suitable for /etc/shadow"
arch=('i686' 'x86_64')
url="https://github.com/rfc1036/whois"
license=('GPL')
depends=('glibc')
makedepends=('perl')
source=("whois-$pkgver.tar.gz::https://github.com/rfc1036/whois/archive/v$pkgver.tar.gz")
sha256sums=('a0f95487ceaba7ee4a69e88b314c8b772c896b4b988a37d71aefcf58cb6b95fb')

build() {
  cd "${srcdir}/whois-${pkgver}"

  make prefix=/usr CFLAGS="$CFLAGS $CPPFLAGS" mkpasswd
}

package() {
  cd "${srcdir}/whois-${pkgver}"

  make prefix=/usr BASEDIR="${pkgdir}" install-mkpasswd
}
