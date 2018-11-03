# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-posframe
pkgver=0.4.1
pkgrel=1
pkgdesc="An extension to lookup words through sdcv (StarDict Console Version) in Emacs."
arch=('any')
url="http://code.google.com/p/sdcv-mode/"
license=('GPL')
depends=('emacs')
source=(https://github.com/tumashu/posframe/raw/master/posframe.el
       https://github.com/tumashu/posframe/raw/master/README.md)
sha256sums=('ab5324ac06ce5aae52ee08d7539f310de417971226747b8223ff8e05a909fa6b'
            '374572d6d4fbd8055d079ade33bc7585ed91b464dbfd1ce7dbb41f7624f38653')

build() {
  emacs -Q -batch -L . -f batch-byte-compile ${pkgname#emacs-}.el
}
package() {
  install -D -m 644 "$srcdir"/${pkgname#emacs-}.el \
	  "$pkgdir"/usr/share/emacs/site-lisp/${pkgname#emacs-}.el
  install -D -m 644 "$srcdir"/${pkgname#emacs-}.elc \
	  "$pkgdir"/usr/share/emacs/site-lisp/${pkgname#emacs-}.elc
  install -D -m 644 "$srcdir"/README.md \
	  "$pkgdir"/usr/share/doc/$pkgname/README.md
  
}
