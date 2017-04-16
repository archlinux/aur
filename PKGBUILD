pkgname=pidgin-birthday-reminder
pkgver=1.9
pkgrel=1
pkgdesc="Pidgin Birthday Reminder Plugin"
url="https://github.com/kgraefe/pidgin-birthday-reminder"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc' 'pidgin')
makedepends=('intltool')
source=(https://github.com/kgraefe/pidgin-birthday-reminder/releases/download/v${pkgver}/pidgin-birthday-reminder-${pkgver}.tar.gz)
sha256sums=('76b3b15a9c5d940ae2a84dd1b1e620550dbad481514748347e86a33a9c971801')

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
