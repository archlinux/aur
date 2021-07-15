# Maintainer: Hanspeter Portner <ventosus at airpost dot net>
# Fixes: Brian Bidulock <bidulock at openss7 dot org>
 
pkgname=linuxptp
_pkgver=3.1
pkgver=${_pkgver}.1
pkgrel=1
pkgdesc='An implementation of the Precision Time Protocol (PTP) according to IEEE standard 1588 for Linux.'
arch=('i686' 'x86_64')
url='http://linuxptp.sourceforge.net/'
license=('GPL')
depends=('glibc')
makedepends=()
source=("${pkgname}-${pkgver}.tgz::https://sourceforge.net/projects/${pkgname}/files/v${_pkgver}/${pkgname}-${pkgver}.tgz/download")
sha256sums=('94d6855f9b7f2d8e9b0ca6d384e3fae6226ce6fc012dbad02608bdef3be1c0d9')
 
build() {
  cd ${pkgname}-${pkgver}
  make EXTRA_CFLAGS="$CFLAGS"
}
 
package() {
  cd ${pkgname}-${pkgver}
  make prefix="${pkgdir}/usr" sbindir='$(prefix)/bin' mandir='$(prefix)/share/man' man8dir='$(mandir)/man8' install
}
