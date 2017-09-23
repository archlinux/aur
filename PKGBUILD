# Contributor: Oliver Mangold
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-adoc-mode
pkgver=0.6.6
pkgrel=2
pkgdesc="Emacs major mode for editing asciidoc files"
arch=('any')
url="http://github.com/sensorflo/adoc-mode"
license=('GPL')
depends=("emacs-markup-faces")
install=emacs-adoc-mode.install
source=("$pkgname-$pkgver.tar.gz::http://github.com/sensorflo/adoc-mode/archive/V$pkgver.tar.gz")
sha256sums=('4ad811081ab69caa83e3f02f68b75a41b9031a1715720045cdd33801523b930f')

build() {
  emacs -batch -q -f batch-byte-compile ${pkgname#emacs-}-$pkgver/${pkgname#emacs-}.el
}

package() {
  # Install the mode for Emacs
  install -D -m644 "$srcdir"/${pkgname#emacs-}-$pkgver/${pkgname#emacs-}.el \
	  "$pkgdir"/usr/share/emacs/site-lisp/${pkgname#emacs-}.el
  install -D -m644 "$srcdir"/${pkgname#emacs-}-$pkgver/${pkgname#emacs-}.elc \
	  "$pkgdir"/usr/share/emacs/site-lisp/${pkgname#emacs-}.elc
}
