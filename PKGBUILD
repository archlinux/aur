# Maintainer: Reberti Carvalho Soares <6reberti6@gmail.com>
pkgname=rshell-git
provides=('rshell')
pkgdesc="KisuYami own shell."
pkgver() {
  cd "$srcdir/RShell-master"
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=r3.gd47ff9e
pkgrel=1
options=()
license=('GPLv2')
arch=('i686' 'x86_64')
groups=('shell' 'suckless')
depends=('ncurses' 'readline')
makedepends=('ncurses' 'readline')
source=('https://gitlab.com/KisuYami/RShell/-/archive/master/RShell-master.tar.gz')
md5sums=('SKIP')
url='https://gitlab.com/KisuYami/rshell'

build() {
  cd $srcdir/RShell-master
  make
}

package() {
  cd $srcdir/RShell-master

  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/man/man1/
  mkdir -p $pkgdir/usr/share/man/pt_BR/man1/

  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
