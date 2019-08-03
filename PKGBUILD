# Mantainer: 3ED_0 <krzysztofas at/protonmail/com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=vim-vim-support
pkgver=2.4
_scriptid=24453
pkgrel=1
pkgdesc='Vim-IDE implements a vim script IDE with hotkeys and snippets from the same author of
vim-{bash,perl,lua,c}-support'
arch=('any')
url='https://www.vim.org/scripts/script.php?script_id=3931'
license=('custom:vim')
groups=('vim-plugins')
depends=('vim')
source=("${pkgname}-$pkgver.zip::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid")
sha256sums=('0d337a559193ba185f7893eeeabcc3fd013f991bd453f51a9c8e05dfd2b22d42')
noextract=("${pkgname}-$pkgver.zip")

package() {
	cd "$srcdir"
	_vim_dir="${pkgdir}/usr/share/vim/vimfiles"

	install -dm755 ${_vim_dir}

	bsdtar -xf ${pkgname}-$pkgver.zip \
		--directory "${_vim_dir}"

	chmod -R a=r,a+X,u+w "${_vim_dir}"
}
