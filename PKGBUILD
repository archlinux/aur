# Maintainer: 

pkgname=emacs-emacsql
pkgver=3.0.0
pkgrel=1
pkgdesc="EmacSQL is a high-level Emacs Lisp front-end for SQLite (primarily), PostgreSQL, MySQL, and potentially other SQL databases."
arch=('any')
url="https://github.com/skeeto/emacsql"
license=('GPL3')
depends=('emacs' 'emacs-pg')
source=("https://github.com/skeeto/emacsql/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('9d94be00518591c68cb0ed1de9dab885e35079f581fb0ae52af5af139a0f1088')

build() {
  cd emacsql-$pkgver
 make LDFLAGS='-L /usr/share/emacs/site-lisp/emacs-pg' 
}

package() {
  cd emacsql-$pkgver
  install -d "$pkgdir"/usr/share/emacs/site-lisp/emacs-emacsql
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/emacs-emacsql
}
