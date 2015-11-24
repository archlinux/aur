# Maintainer: Sebastian Wilzbach <sebi [at] wilzbach [dot] me>

pkgname=pidgin-recent-contacts-git
_pkgname="Recent-Contacts-Plugin-for-Pidgin"
pkgver=r0.9
pkgrel=1
pkgdesc="Recent Contact/Buddy List for Pidgin"
arch=(i686 x86_64)
url="https://github.com/segler-alex/Recent-Contacts-Plugin-for-Pidgin"
license=('unknown')
depends=(pidgin)
source=(git+https://git@github.com/interskh/Recent-Contacts-Plugin-for-Pidgin.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"

  cmake -D CMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm 644 librecent_contacts.so "$pkgdir/usr/lib/pidgin/librecent_contacts.so"
}
