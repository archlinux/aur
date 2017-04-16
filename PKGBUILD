pkgname=pidgin-birthday-reminder
pkgver=1.11
pkgrel=1
pkgdesc="Pidgin Birthday Reminder Plugin"
url="https://github.com/kgraefe/pidgin-birthday-reminder"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc' 'pidgin')
makedepends=('intltool')
source=(https://github.com/kgraefe/pidgin-birthday-reminder/releases/download/v${pkgver}/pidgin-birthday-reminder-${pkgver}.tar.gz)
sha256sums=('ae9af7e24719677305cebb2c817807f82813d9e6f85fcba5248b77b9a1d5deea')

prepare() {
  cd ${srcdir}/pidgin-birthday-reminder-${pkgver}
  ./configure --prefix=/usr --mandir=/usr/share/man
}

build() {
  cd ${srcdir}/pidgin-birthday-reminder-${pkgver}
  make || return 1
}

package() {
  cd ${srcdir}/pidgin-birthday-reminder-${pkgver}
  make DESTDIR=${pkgdir} install
}
