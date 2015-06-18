# Maintainer: Hanspeter Portner <ventosus at airpost dot net>
# Fixes: Brian Bidulock <bidulock at openss7 dot org>
 
pkgname=linuxptp
pkgver=1.5
pkgrel=3
pkgdesc='An implementation of the Precision Time Protocol (PTP) according to IEEE standard 1588 for Linux.'
arch=('i686' 'x86_64')
url='http://linuxptp.sourceforge.net/'
license=('GPL')
depends=('glibc')
makedepends=()
source=("https://sourceforge.net/projects/${pkgname}/files/${pkgname}-${pkgver}.tgz/download")
md5sums=('f7f24174b7ce52eccaed1748409057b0')
 
build() {
  cd ${pkgname}-${pkgver}
  make EXTRA_CFLAGS="$CFLAGS"
}
 
package() {
  cd ${pkgname}-${pkgver}
  make prefix="${pkgdir}/usr" sbindir='$(prefix)/bin' mandir='$(prefix)/share/man' man8dir='$(mandir)/man8' install
}
