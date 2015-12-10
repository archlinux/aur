# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: lolilolicon <lolilolicon_at_gmail_dot_com>

pkgname=vim-gundo
pkgver=2.6.0
pkgrel=1
pkgdesc='Vim plugin to visualize your Vim undo tree'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=3304'
license=('GPL2')
depends=('vim>=7.3')
groups=('vim-plugins')
install=vimdoc.install
source=("https://github.com/sjl/${pkgname#vim-}.vim/archive/v$pkgver.tar.gz")
sha256sums=('3e9318711124a358550d6d4943894fb1976614c3dc7f62ae539a91ec848dc815')

package() {
  cd "${pkgname#vim-}.vim-$pkgver"
  local _vimdir="$pkgdir/usr/share/vim/vimfiles"
  install -D -m644 {,"$_vimdir/"}"autoload/${pkgname#vim-}.py"
  install -D -m644 {,"$_vimdir/"}"autoload/${pkgname#vim-}.vim"
  install -D -m644 {,"$_vimdir/"}"doc/${pkgname#vim-}.txt"
  install -D -m644 {,"$_vimdir/"}"plugin/${pkgname#vim-}.vim"
}
