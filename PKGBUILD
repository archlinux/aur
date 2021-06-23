# Maintainer: jjacky
_pkgname=weeplugins
pkgname=$_pkgname-git
pkgver=r9.81c10d5
pkgrel=1
pkgdesc="WeeChat plugins: NickServ handling, trigger commands on messages, command to send text/command to specific buffer"
arch=('i686' 'x86_64')
url="https://github.com/jjk-jacky/weeplugins"
license=('GPL3+')
depends=('weechat')
makedepends=('git')
source=("git+https://github.com/jjk-jacky/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
