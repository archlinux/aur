# Maintainer: Hanspeter Portner <ventosus at airpost dot net>
# Fixes: Brian Bidulock <bidulock at openss7 dot org>
 
pkgname=linuxptp
pkgver=3.0
pkgrel=2
pkgdesc='An implementation of the Precision Time Protocol (PTP) according to IEEE standard 1588 for Linux.'
arch=('i686' 'x86_64')
url='http://linuxptp.sourceforge.net/'
license=('GPL')
depends=('glibc')
makedepends=()
source=("${pkgname}-${pkgver}.tgz::https://sourceforge.net/projects/${pkgname}/files/v${pkgver}/${pkgname}-${pkgver}.tgz/download")
sha256sums=('d74ceca722c75bfff53c633425f926dd48eb04f4a089451b855155c016d15785')
 
build() {
  cd ${pkgname}-${pkgver}
  make EXTRA_CFLAGS="$CFLAGS"
}
 
package() {
  cd ${pkgname}-${pkgver}
  make prefix="${pkgdir}/usr" sbindir='$(prefix)/bin' mandir='$(prefix)/share/man' man8dir='$(mandir)/man8' install
}
