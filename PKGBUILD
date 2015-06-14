# Maintainer: Det <nimetonmaili g-mail>
# Contributor: peace4all <markspost at rocketmail dot com>
# Contributor: JokerBoy (www.punctweb.ro)

pkgname=pidgin-nudge-svn
pkgver=r9
pkgrel=1
pkgdesc="A Pidgin plugin for shaking the conversation window on nudges/buzzes (SVN)"
arch=('i686' 'x86_64')
url="https://code.google.com/p/pidgin-nudge/"
license=('GPL2')
depends=('pidgin')
makedepends=('subversion')
conflicts=('pidgin-nudge')
source=("pidgin-nudge-read-only::svn+https://pidgin-nudge.googlecode.com/svn/trunk/")
md5sums=('SKIP')

pkgver() {
  cd pidgin-nudge-read-only
  echo r$(svnversion)
}

build() {
  cd pidgin-nudge-read-only
  msg "Running make..."
  make
}

package() {
  cd pidgin-nudge-read-only
  msg "Running make install..."
  make DESTDIR="$pkgdir" install
}
