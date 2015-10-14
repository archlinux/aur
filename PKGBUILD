# Maintainer: Pierre Neidhardt <ambrevar@gmail.com>

pkgname=emacs-make-regexp
pkgver=1.02
pkgrel=3
pkgdesc="Generate efficient regexps to match strings in Emacs"
arch=("any")
url="http://svn.r-project.org/ESS/"
license=("GPL")
depends=("emacs")
makedepends=("emacs")
source=("http://svn.r-project.org/ESS/tags/14.09/lisp/make-regexp.el")
sha1sums=("41b301527c99c47a8aa6a514e3b95324dd319c94")

build() {
	emacs --batch --no-site-file -f batch-byte-compile make-regexp.el
}

package() {
	mkdir -p "$pkgdir/usr/share/emacs/site-lisp"
	cp *.el{c,} "$pkgdir/usr/share/emacs/site-lisp/"
}
