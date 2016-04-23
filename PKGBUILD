# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-xelb-git
pkgver=r82.ecd68de
pkgrel=1
pkgdesc="emacs interface to xcb"
arch=('any')
url="https://github.com/ch11ng/xelb"
license=('GPL')
depends=('emacs')
makedepends=('git')
provides=('emacs-xelb')
conflicts=('emacs-xelb')
source=("git+https://github.com/ch11ng/xelb.git")
md5sums=('SKIP')
_gitname="xelb"

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

package() {
  cd "$srcdir/$_gitname"
  for _i in *.el
  do
    install -Dm644 ${_i} $pkgdir/usr/share/emacs/xelb/${_i}
  done
  install -Dm644 README.md $pkgdir/usr/share/doc/emacs-xelb/README.md
}
