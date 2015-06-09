# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=tty-clock-git
pkgver=latest
pkgrel=1
pkgdesc="Analog clock in ncurses."
arch=('i686' 'x86_64' 'armv6h')
url="http://github.com/xorg62/tty-clock"
license=('BSD')
depends=('ncurses')
source=("git+https://git@github.com/xorg62/tty-clock.git")
md5sums=("SKIP")

_gitname="tty-clock"

pkgver() {
  cd "$srcdir/${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm 755 $_gitname "$pkgdir/usr/bin/$_gitname"
} 
