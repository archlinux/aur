# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>
# Contributor: Tim Diels <limyreth[at]gmail.com>

pkgname=vimpdb
pkgver='0.beta'
pkgrel=4
pkgdesc="A vim script for debugging python."
arch=(any)
url="http://code.google.com/p/vimpdb/"
license=('GPL3')
depends=(vim-runtime python)
source=('http://vimpdb.googlecode.com/files/VimPdb.tar')
md5sums=('ba777bb3f8f2dd991958f3011779c082')

package() {
  cd "$srcdir"
  sed 's/\r//' -i VimPdb.vim VimPdb.py
  install  -Dm644 VimPdb.py \
    "$pkgdir"/usr/share/vim/vimfiles/plugin/VimPdb.py
  install -Dm644 VimPdb.vim \
    "$pkgdir"/usr/share/vim/vimfiles/plugin/VimPdb.vim
  install -Dm644 readme.txt \
    "$pkgdir"/usr/share/doc/vimpdb/readme.txt
}

