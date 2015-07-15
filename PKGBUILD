# Maintainer: Mauro Santos <registo.mailling@gmail.com>
# Contributer: Ng Oon-Ee <ngoonee.talk@gmail.com>

pkgname=pidgin-gtalksharedstatus
_realname=gtalk-shared-status
pkgver=0.2.5
pkgrel=1
pkgdesc="Adds Google Shared Status compatibility that permits to set the status for all the resources connected. This allows to go Invisible on GTalk."
url="http://www.siorarina.net/gtalk-shared-status/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libpurple')
makedepends=('pkg-config')
source=(http://www.siorarina.net/gss/src/${_realname}-${pkgver}.src.tar.gz)
md5sums=('651444f5e7e8f35aaa108c471d571030')
PKGEXT='.pkg.tar'

prepare() {
  cd ${srcdir}/${_realname}-${pkgver}
  sed -i -e "s|~/.purple/plugins|${pkgdir}/usr/lib/pidgin|" Makefile
  sed -i -e "s|^CFLAGS :=|CFLAGS := -O2|" Makefile
}

build() {
  cd ${srcdir}/${_realname}-${pkgver}
  make
}

package() {
  cd ${srcdir}/${_realname}-${pkgver}
  make install
}
