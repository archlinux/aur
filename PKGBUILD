# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-tabbar-git
pkgver=372
pkgrel=1
pkgdesc="Emacs minor mode that displays a tab bar at the top"
arch=('any')
url="https://github.com/dholm/tabbar.git"
license=('GPL')
makedepends=('git')
source=("git://github.com/dholm/tabbar.git")
noextract=()
md5sums=('SKIP')
_gitname="tabbar"

pkgver() {
  cd "$srcdir"/"$_gitname"
  printf "%s" "$(git rev-list --count HEAD)" 
}

package() {
  cd "$srcdir/$_gitname"
  install -d $pkgdir/usr/share/emacs/site-lisp/tabbar
  for _i in *.el *.tiff *.png
  do install -Dm644 $_i $pkgdir/usr/share/emacs/site-lisp/tabbar/${_i}
  done
}
