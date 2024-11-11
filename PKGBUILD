# Maintainer: Hanspeter Portner <ventosus at airpost dot net>
# Fixes: Brian Bidulock <bidulock at openss7 dot org>
 
pkgname=linuxptp
pkgver=4.4
pkgrel=1
pkgdesc='An implementation of the Precision Time Protocol (PTP) according to IEEE standard 1588 for Linux.'
arch=('i686' 'x86_64')
url='https://linuxptp.nwtime.org/'
license=('GPL')
depends=('glibc')
source=("https://downloads.nwtime.org/linuxptp/${pkgname}-${pkgver}.tgz")
sha256sums=('61757bc0a58d789b8fcbdddf56c88a0230597184a70dcb2ac05b4c6b619f7d5c')
 
build() {
  cd ${pkgname}-${pkgver}
  make EXTRA_CFLAGS="$CFLAGS"
}
 
package() {
  cd ${pkgname}-${pkgver}
  make prefix="${pkgdir}/usr" sbindir='$(prefix)/bin' mandir='$(prefix)/share/man' man8dir='$(mandir)/man8' install
}
