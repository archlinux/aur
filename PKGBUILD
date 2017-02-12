# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-yasnippet-git
pkgver=0.11.0_26_gc87afe0
pkgrel=1
pkgdesc="Yet another template system for Emacs - git version"
arch=('any')
url="https://github.com/capitaomorte/yasnippet"
license=('GPL')
makedepends=('git')
provides=('emacs-yasnippet')
conflicts=('emacs-yasnippet')
install=yasnippet.install
source=('git+https://github.com/capitaomorte/yasnippet')
md5sums=('SKIP')
_gitname=yasnippet

pkgver() {
  cd "$srcdir"/$_gitname
  git describe --tags|sed 's/-/_/g'
}

package () {
  cd "$srcdir/$_gitname"
  install -d  $pkgdir/usr/share/emacs/site-lisp/yas
  cp -r * $pkgdir/usr/share/emacs/site-lisp/yas
}
