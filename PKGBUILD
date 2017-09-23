# Contributor: Oliver Mangold
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-markup-faces
pkgver=1.0.0
pkgrel=2
pkgdesc="Like font-lock-faces, but tailored for markup languages instead programming languages"
arch=('any')
url="http://github.com/sensorflo/markup-faces"
license=('GPL3')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::http://github.com/sensorflo/${pkgname#emacs-}/archive/V$pkgver.tar.gz")
sha256sums=('39373f227eaf4ad72be4438ba36bbb2d581672c609f30d81b3a32fce46eb3f41')

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
