# Maintainer: Reberti Carvalho Soares <6reberti6@gmail.com>
pkgname=kyfm-git
provides=('kyfm')
pkgdesc="The fastest file manager."
pkgrel=1
pkgver=1.3
options=()
license=('GPLv2')
arch=('i686' 'x86_64')
depends=('ncurses' 'readline')
makedepends=('ncurses' 'readline')
groups=('file-management' 'suckless')
source=('https://gitlab.com/KisuYami/kyfm/-/archive/master/kyfm-master.tar.gz')
url='https://gitlab.com/KisuYami/kyfm'
md5sums=('SKIP')

build() {
  tar xf kyfm-master.tar.gz
  cd kyfm-master
  make
}

package() {
  cd kyfm-master

  mkdir -p "$pkgdir"/usr/bin/
  make DESTDIR="$pkgdir"/usr/bin/ install
}

# vim:set ts=2 sw=2 et:
