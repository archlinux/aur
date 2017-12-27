# $Id$
# Maintainer: fabio zanini <fabio dot zanini at fastmail dot fm>
pkgname=vim-completor-git
pkgver=r227.6e4fba0
pkgrel=1
pkgdesc='Asynchronous code completion framework for vim8'
arch=('any')
url='https://github.com/maralla/completor.vim'
license=('MIT')
depends=('vim-runtime')
makedepends=('git')
install='vimdoc.install'
source=("vim-completor-git::git+https://github.com/maralla/completor.vim.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  _installpath="$pkgdir/usr/share/vim/vimfiles/pack/completor/start/completor.vim"
  install -d "$_installpath"
  cp -r ./* "$_installpath/"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

