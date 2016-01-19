# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: lolilolicon <lolilolicon_at_gmail_dot_com>

pkgname=vim-gundo
pkgver=2.6.1
pkgrel=1
pkgdesc='Vim plugin to visualize your Vim undo tree'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=3304'
license=('GPL2')
depends=('vim>=7.3')
groups=('vim-plugins')
install=vimdoc.install
source=("https://github.com/sjl/${pkgname#vim-}.vim/archive/v$pkgver.tar.gz")
sha256sums=('6cacba104238169af6e9e2863cf500922a59cb6cb49885b36381a7f5d108be77')

package() {
  cd "${pkgname#vim-}.vim-$pkgver"
  local _vimdir="$pkgdir/usr/share/vim/vimfiles"
  install -D -m644 {,"$_vimdir/"}"autoload/${pkgname#vim-}.py"
  install -D -m644 {,"$_vimdir/"}"autoload/${pkgname#vim-}.vim"
  install -D -m644 {,"$_vimdir/"}"doc/${pkgname#vim-}.txt"
  install -D -m644 {,"$_vimdir/"}"plugin/${pkgname#vim-}.vim"
}
