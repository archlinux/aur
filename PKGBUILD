# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: lolilolicon <lolilolicon_at_gmail_dot_com>

pkgname=vim-gundo
pkgver=2.6.2
pkgrel=2
pkgdesc='Vim plugin to visualize your Vim undo tree'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=3304'
license=('GPL-2.0-or-later')
groups=('vim-plugins')
depends=('vim-plugin-runtime') # needs vim>=7.3
source=("$pkgname-$pkgver.tar.gz::https://github.com/sjl/${pkgname#vim-}.vim/archive/v$pkgver.tar.gz")
sha256sums=('eeb279f41ea3651bccced8a3f609d40e8cf914eb8ebdf403acac21af68e1b4a0')

package() {
  cd "${pkgname#vim-}.vim-$pkgver"
  local _vimdir="$pkgdir/usr/share/vim/vimfiles"
  install -D -m644 {,"$_vimdir/"}"autoload/${pkgname#vim-}.py"
  install -D -m644 {,"$_vimdir/"}"autoload/${pkgname#vim-}.vim"
  install -D -m644 {,"$_vimdir/"}"doc/${pkgname#vim-}.txt"
  install -D -m644 {,"$_vimdir/"}"plugin/${pkgname#vim-}.vim"
}
