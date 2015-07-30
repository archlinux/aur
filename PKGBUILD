# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
pkgname=vim-vim-support
pkgver=2.3
_scriptid=22356
pkgrel=1
pkgdesc='Vim-IDE implements a vim script IDE with hotkeys and snippets from the same author of
vim-{bash,perl,lua,c}-support'
arch=('any')
url='http://vim.org/scripts/script.php?script_id=3931'
license=('custom:vim')
groups=('vim-plugins')
depends=('vim')
install='vimdoc.install'
source=("${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid")

package() {
	cd "$srcdir"
	_vim_dir='usr/share/vim/vimfiles'

  install -dm755 ${pkgdir}/${_vim_dir} || return 1

  tar -c ./  --exclude ${pkgname}.zip | tar -x -C ${pkgdir}/${_vim_dir} || return 1

}

md5sums=('6946539f736dc47acaef682e219beda8')

# vim:set ts=2 sw=2 et ft=sh tw=100:
