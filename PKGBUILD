# Contributor: grimi <grimi at poczta dot fm>

pkgname=pidgin-tlen-git
pkgver=b8c464e
pkgrel=2
pkgdesc="An Tlen.pl protocol plugin for Pidgin"
arch=('i686' 'x86_64')
url="https://github.com/pelotasplus/pidgin-tlen"
license=('BSD')
depends=('libpurple')
conflicts=('pidgin-tlen')
provides=('pidgin-tlen')
source=("$pkgname::git://github.com/pelotasplus/pidgin-tlen.git")
md5sums=('SKIP')


pkgver() {
  cd $pkgname
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd $pkgname
  sed 's/wheel/root/g' -i Makefile
}

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make install DESTDIR="$pkgdir" LOCALBASE=/usr
}

