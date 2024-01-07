# $Id$
# Maintainer: Felip Manyer i Ballester <archlinux at res hyphen telae dot cat>
# Contributor: jeff tracy <jefftracy nine one one at aol dot com>

pkgname=vim-lightline-git
pkgver=r685.1c6b455
pkgrel=1
pkgdesc='A light and configurable statusline/tabline for Vim'
arch=('any')
url='https://github.com/itchyny/lightline.vim'
license=('MIT')
depends=('vim-runtime')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "lightline.vim"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

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

