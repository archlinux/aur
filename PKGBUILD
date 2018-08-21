# Maintainer: Michael Herzberg <{firstname}@{firstinitial}{lastname}.de>

pkgname=vim-fzf-git
pkgver=r327.f39c92b
pkgrel=1
pkgdesc='Vim plugin that integrates fzf, the fuzzy file finder'
arch=('any')
license=('MIT')
url='https://github.com/junegunn/fzf.vim'
depends=('vim' 'fzf')
makedepends=('git')
source=('git+https://github.com/junegunn/fzf.vim')
md5sums=('SKIP')

pkgver() {
  cd fzf.vim
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd fzf.vim
  install -Dm644  plugin/fzf.vim "${pkgdir}/usr/share/vim/vimfiles/plugin/fzf/fzf.vim"
  cp -R autoload bin doc "${pkgdir}/usr/share/vim/vimfiles/"
}
