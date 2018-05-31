# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>
# Contributor: Tim Diels <limyreth[at]gmail.com>

pkgname=vimpdb
_pkgname=VimPdb
pkgver='0.1'
pkgrel=1
pkgdesc="A vim script for debugging python."
arch=(any)
# url="http://code.google.com/p/vimpdb/"
url='https://github.com/vim-scripts/VimPdb'
license=('GPL3')
depends=(vim-runtime python)
# source=('http://vimpdb.googlecode.com/files/VimPdb.tar')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vim-scripts/VimPdb/archive/$pkgver.tar.gz")
sha256sums=('b56c1c320f71a76c9144aceb9b498755b67c3b90475c96d32864dcc9050d38ad')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  sed 's/\r//' -i VimPdb.py plugin/VimPdb.vim doc/readme.txt
}
package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install  -Dm644 VimPdb.py \
    "$pkgdir"/usr/share/vim/vimfiles/plugin/VimPdb.py
  install -Dm644 plugin/VimPdb.vim \
    "$pkgdir"/usr/share/vim/vimfiles/plugin/VimPdb.vim
  install -Dm644 doc/readme.txt \
    "$pkgdir"/usr/share/doc/vimpdb/readme.txt
}

