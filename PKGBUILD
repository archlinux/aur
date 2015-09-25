# Maintainer: Pierre Neidhardt <ambrevar at gmail dot com>

pkgname=emacs-flex-mode
pkgver=1.0
pkgrel=3
pkgdesc="Emacs major mode for flex"
arch=("any")
url="http://www.emacswiki.org/emacs/FlexMode"
license=("GPL")
makedepends=("emacs")
optdepends=("emacs")
source=("http://ftp.sunet.se/pub/gnu/emacs-lisp/incoming/flex-mode.el")
sha1sums=("a63c956e21a42849c1f5277dcdf1538e21846322")

build() {
	emacs --batch --no-site-file -f batch-byte-compile flex-mode.el
}

package() {
	mkdir -p "$pkgdir/usr/share/emacs/site-lisp"
	cp *.el{c,} "$pkgdir/usr/share/emacs/site-lisp/"
}
