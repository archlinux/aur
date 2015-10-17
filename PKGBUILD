# Maintainer: Flávio Zavan <flavio dot zavan at gmail dot com>
pkgname=hugs
pkgver=2006.09
pkgrel=1
pkgdesc="A functional programming system based on Haskell 98"
arch=('any')
url="https://www.haskell.org/hugs/index.html"
license=('BSD')
source=('https://www.haskell.org/hugs/downloads/2006-09/hugs98-plus-Sep2006.tar.gz'
    'hsbase_inline.patch')
sha1sums=('1464a80c715bc5f786ea5a4e4257b2ff0dc7e1e9'
    'ef1a167c2327b3d1bdf8a284a22635f6a6ed7e8b')

build() {
  cd "hugs98-plus-Sep2006"
  patch -p1 -i "../hsbase_inline.patch"
  ./configure --prefix="/usr"
  make
}

package() {
  cd "hugs98-plus-Sep2006"
  make DESTDIR="$pkgdir" install
}
