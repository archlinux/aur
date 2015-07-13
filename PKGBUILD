# Contributor: Yichao Yu <yyc1992@gmail.com>
# Contributor: Hauke Wesselmann <hauke@h-dawg.de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-js2-mode-git
pkgver=20150713
pkgrel=1
pkgdesc="An improved JavaScript mode for GNU Emacs"
arch=('any')
url="https://github.com/mooz/js2-mode"
license=('GPL3')
depends=('emacs')
provides=('emacs-js2-mode')
conflicts=('emacs-js2-mode')
_gitname=js2-mode
source=('git+https://github.com/mooz/js2-mode.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/$_gitname
  echo $(git log -1 --format="%cd" --date=short | sed 's|-||g')
}

build() {
  cd "$srcdir/$_gitname"
  make
}
package() {
  cd "$srcdir/$_gitname"
  install -Dm644 js2-mode.el "$pkgdir/usr/share/emacs/site-lisp/js2-mode.el"
  install -Dm644 js2-mode.elc "$pkgdir/usr/share/emacs/site-lisp/js2-mode.elc"
  install -Dm644 js2-imenu-extras.el \
    "$pkgdir/usr/share/emacs/site-lisp/js2-imenu-extras.el"
  install -Dm644 js2-imenu-extras.elc \
    "$pkgdir/usr/share/emacs/site-lisp/js2-imenu-extras.elc"
}
