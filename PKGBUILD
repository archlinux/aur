# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-posframe
pkgver=0.5.0
pkgrel=1
pkgdesc="Emacs library to pop up a child frame at point."
arch=('any')
url="https://github.com/tumashu/posframe.git"
license=('GPL')
depends=('emacs')
source=(https://github.com/tumashu/posframe/raw/master/posframe.el
       posframe.readme.md::https://github.com/tumashu/posframe/raw/master/README.md)
sha256sums=('960605bc7645da2a55a517e1a216064fac420cd031bd088aad0d3636ad899862'
            '4f97edf25d9126994005e383ab39467f8f0300bf2f5e394de9f837ebe8c246d2')

build() {
  emacs -Q -batch -L . -f batch-byte-compile ${pkgname#emacs-}.el
}

package() {
  install -D -m 644 "$srcdir"/${pkgname#emacs-}.el \
	  "$pkgdir"/usr/share/emacs/site-lisp/${pkgname#emacs-}.el
  install -D -m 644 "$srcdir"/${pkgname#emacs-}.elc \
	  "$pkgdir"/usr/share/emacs/site-lisp/${pkgname#emacs-}.elc
  install -D -m 644 "$srcdir"/posframe.readme.md \
	  "$pkgdir"/usr/share/doc/$pkgname/README.md
}
