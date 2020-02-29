# Maintainer: Jonathan Waldrep <spartan074@gmail.com>
pkgname=vim-racket-git
pkgver=r141.55aba05
pkgrel=1
pkgdesc="Syntax and supporting functionality for the racket filetype"
arch=('any')
url="https://github.com/wlangstroth/vim-racket"
license=('MIT')
makedepends=('git')
source=('git://github.com/wlangstroth/vim-racket.git')
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/vim-racket
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/vim-racket

  # Install license
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install vim files.
  local _vimfiles="${pkgdir}/usr/share/vim/vimfiles"
  install -D -m644 ftdetect/racket.vim "${_vimfiles}/ftdetect/racket.vim"
  install -D -m644 ftplugin/racket.vim "${_vimfiles}/ftplugin/racket.vim"
  install -D -m644 indent/racket.vim "${_vimfiles}/indent/racket.vim"
  install -D -m644 syntax/racket.vim "${_vimfiles}/syntax/racket.vim"
}

