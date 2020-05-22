# Maintainer: Reberti Carvalho Soares <6reberti6@gmail.com>
pkgname=kyfm-git
provides=('kyfm')
pkgdesc="The fastest file manager."
pkgver() {
  cd "$srcdir/kyfm-master"
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=r5.gc765d6a
pkgrel=1
options=()
license=('GPLv2')
arch=('i686' 'x86_64')
depends=('ncurses' 'readline')
makedepends=('ncurses' 'readline' 'tar')
groups=('file-management' 'suckless')
source=('https://gitlab.com/KisuYami/kyfm/-/archive/master/kyfm-master.tar.gz')
md5sums=('SKIP')
url='https://gitlab.com/KisuYami/kyfm'

build() {
  cd $srcdir/kyfm-master
  make
}

package() {
  cd $srcdir/kyfm-master

  mkdir -p $pkgdir/usr/bin/
  make DESTDIR=$pkgdir/usr/bin/ install
}

# vim:set ts=2 sw=2 et:
