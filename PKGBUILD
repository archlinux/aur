# Maintainer: Jonathan Waldrep <spartan074@gmail.com>
pkgname=vim-racket-git
pkgver=r159.32ad231
pkgrel=1
pkgdesc="Syntax and supporting functionality for the racket filetype"
arch=('any')
url="https://github.com/wlangstroth/vim-racket"
license=('MIT')
depends=('vim')
makedepends=('git')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd vim-racket
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd vim-racket

  # Install license
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install vim files.
  local _vimfiles="${pkgdir}/usr/share/vim/vimfiles"
  install -D -m644 ftdetect/racket.vim "${_vimfiles}/ftdetect/racket.vim"
  install -D -m644 ftplugin/racket.vim "${_vimfiles}/ftplugin/racket.vim"
  install -D -m644 indent/racket.vim "${_vimfiles}/indent/racket.vim"
  install -D -m644 syntax/racket.vim "${_vimfiles}/syntax/racket.vim"
}

