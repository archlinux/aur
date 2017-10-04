# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Chris Mann <cshclm at gmail dot com>

pkgname=unrar-free
pkgver=20140707
pkgrel=1
pkgdesc="Free utility to extract files from RAR archives."
url="http://gna.org/projects/unrar/"
arch=('i686' 'x86_64')
depends=("glibc")
license=('GPL')
source=('http://http.debian.net/debian/pool/main/u/unrar-free/unrar-free_0.0.1+cvs20140707.orig.tar.gz')
sha256sums=('30ba9f9f62abf7f14b7d516864d60fca43d48a93090179685780dd318dd2dba3')

build() {
  cd "${srcdir}/unrar-0.0.1"
  ./configure --prefix=/usr --program-suffix=-free
  make
}

package() {
  cd "${srcdir}/unrar-0.0.1"
  make DESTDIR="${pkgdir}" install
}
