# Maintainer: Leif Warner <abimelech@gmail.com>
pkgname=vim-psc-ide-git
pkgver=0.8.2.r29.g5fb4e32
pkgrel=1
pkgdesc="A vim plugin that interfaces with purs ide"
arch=('any')
url="https://github.com/FrigoEU/psc-ide-vim"
depends=('vim')
optdepends=(
  'purescript: the purescript compiler'
  'vim-syntastic'
)
makedepends=('git')
provides=('vim-psc-ide')
conflicts=('vim-psc-ide')

source=("git://github.com/FrigoEU/psc-ide-vim.git")
md5sums=('SKIP')
_gitname="psc-ide-vim"

pkgver() {
  cd $_gitname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $_gitname

  install -D -m644 autoload/purescript/ide/import.vim "${pkgdir}/usr/share/vim/vimfiles/autoload/purescript/ide/import.vim"
  install -D -m644 autoload/purescript/ide/utils.vim "${pkgdir}/usr/share/vim/vimfiles/autoload/purescript/ide/utils.vim"
  install -D -m644 autoload/purescript/ide.vim "${pkgdir}/usr/share/vim/vimfiles/autoload/purescript/ide.vim"
  install -D -m644 autoload/purescript/job.vim "${pkgdir}/usr/share/vim/vimfiles/autoload/purescript/job.vim"
  install -D -m644 doc/psc-ide-vim.txt "${pkgdir}/usr/share/vim/vimfiles/doc/psc-ide-vim.txt"
  install -D -m644 ftplugin/purescript_pscide.vim "${pkgdir}/usr/share/vim/vimfiles/ftplugin/purescript_pscide.vim"
  install -D -m644 syntax_checkers/purescript/pscide.vim "${pkgdir}/usr/share/vim/vimfiles/syntax_checkers/purescript/pscide.vim"
} 
