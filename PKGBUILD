# Maintainer: Leif Warner <abimelech@gmail.com>
pkgname=vim-idris-git
pkgver=110.45680a3
pkgrel=1
pkgdesc="Vim syntax support for the dependently-typed Idris language."
arch=('any')
url="https://github.com/idris-hackers/idris-vim"
license=('MIT')
depends=('vim')
makedepends=('git')
provides=('vim-idris')
conflicts=('vim-idris')

source=("git://github.com/idris-hackers/idris-vim.git")
md5sums=('SKIP')
_gitname="idris-vim"

pkgver() {
  cd $_gitname
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd $_gitname

  for x in syntax indent ftdetect ftplugin; do
    install -D -m644 $x/idris.vim "${pkgdir}/usr/share/vim/vimfiles/$x/idris.vim"
  done
  install -D -m644 syntax_checkers/idris/idris.vim "${pkgdir}/usr/share/vim/vimfiles/syntax_checkers/idris/idris.vim"
} 
