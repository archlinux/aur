# Maintainer: Mauro Santos <registo.mailling@gmail.com>
# Contributer: Ng Oon-Ee <ngoonee.talk@gmail.com>

pkgname=pidgin-gtalksharedstatus
_realname=gtalk-shared-status
pkgver=0.2.5
pkgrel=2
pkgdesc="Adds Google Shared Status compatibility that permits to set the status for all the resources connected. This allows to go Invisible on GTalk."
url="http://www.siorarina.net/gtalk-shared-status/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libpurple')
makedepends=('pkg-config')
source=(http://www.siorarina.net/gss/src/${_realname}-${pkgver}.src.tar.gz)
sha256sums=('a82939ebd2321643eb37f33cb49dc56dd8e919bbaf7731dd72ba32646ff7c6b8')

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
