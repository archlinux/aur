pkgname=pidgin-birthday-reminder
pkgver=1.13
pkgrel=1
pkgdesc="Pidgin Birthday Reminder Plugin"
url="https://github.com/kgraefe/pidgin-birthday-reminder"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc' 'pidgin')
makedepends=('intltool')
source=(https://github.com/kgraefe/pidgin-birthday-reminder/releases/download/v${pkgver}/pidgin-birthday-reminder-${pkgver}.tar.gz)
sha256sums=('c9a7d7e24bae42d4ead1b096599e3a803cbf1091b0b782d12bcc297d9359f007')

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
