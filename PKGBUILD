# Maintainer: Leif Warner <abimelech@gmail.com>
pkgname=vim-purescript-git
pkgver=17.92dd6bc
pkgrel=1
pkgdesc="Vim syntax support for the Purescript language."
arch=('any')
url="https://github.com/raichoo/purescript-vim"
license=('MIT')
depends=('vim')
makedepends=('git')
provides=('vim-purescript')
conflicts=('vim-purescript')

source=("git://github.com/raichoo/purescript-vim.git")
md5sums=('SKIP')
_gitname="purescript-vim"

pkgver() {
  cd $_gitname
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd $_gitname

  for x in syntax indent ftdetect; do
    install -D -m644 $x/purescript.vim "${pkgdir}/usr/share/vim/vimfiles/$x/purescript.vim"
  done
} 
