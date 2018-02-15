pkgname=pidgin-birthday-reminder
pkgver=1.12
pkgrel=1
pkgdesc="Pidgin Birthday Reminder Plugin"
url="https://github.com/kgraefe/pidgin-birthday-reminder"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc' 'pidgin')
makedepends=('intltool')
source=(https://github.com/kgraefe/pidgin-birthday-reminder/releases/download/v${pkgver}/pidgin-birthday-reminder-${pkgver}.tar.gz)
sha256sums=('1a7e55e15400e1ad4d264d5416999c47a37b28e0f3f184fb353126458b9f4d65')

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
