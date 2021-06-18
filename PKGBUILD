# Maintainer: hamki <hamki.do2000@gmail.com>

pkgname=emacs-emacsql-sqlite3
pkgver=1.0.2
pkgrel=1
pkgdesc="This is yet another EmacSQL backend for SQLite, which use official sqlite3 executable to access SQL database."
arch=('any')
url="https://github.com/cireu/emacsql-sqlite3"
license=('GPL3')
depends=('emacs' 'emacs-emacsql')
source=("https://github.com/cireu/emacsql-sqlite3/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('10cd12382bbb9cbbf36d45382b2aff1a679c3af70574954561ed1caf5fc328f7')

build() {
  cd emacsql-sqlite3-$pkgver
emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd emacsql-sqlite3-$pkgver
  install -d "$pkgdir"/usr/share/emacs/site-lisp/emacsql-sqlite3
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/emacsql-sqlite3
}
