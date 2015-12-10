# $Id$
# Maintainer: jeff tracy <jefftracy nine one one at aol dot com>
# Contributor: 

pkgname=vim-lightline-git
pkgver=latest
pkgrel=1
pkgdesc='A light and configurable statusline/tabline for Vim'
arch=('any')
url='https://github.com/itchyny/lightline.vim'
license=('MIT')
depends=('vim-runtime')
makedepends=('git')
install='vimdoc.install'
source=("git://github.com/itchyny/lightline.vim.git")
md5sums=('SKIP')

package() {
  cd "lightline.vim"

  _installpath="$pkgdir/usr/share/vim/vimfiles"
  install -Dm755 doc/lightline.txt "$_installpath/doc/lightline.txt"
  install -Dm755 plugin/lightline.vim "$_installpath/plugin/lightline.vim"
  install -d "$_installpath/autoload"
  install -d "$_installpath/t"
  cp -R autoload/* "$_installpath/autoload"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

