# Contributor: Aaron Griffin <aaron@archlinux.org>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=vim-workspace
pkgver=1.0b1
_scriptid=4812
pkgrel=10
pkgdesc="vim workspace manager plugin for managing groups of files "
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=1410"
license=('unknown')
depends=('vim')
makedepends=('unzip')
groups=('vim-plugins')
source=(https://www.vim.org/scripts/download_script.php?src_id=$_scriptid)
md5sums=('bd6828d19ce7c62aac0afe28b881a8ba')

build() {
	cd ${srcdir}

	mv download_script.php?src_id=$_scriptid workspace_1b1.zip
	unzip -qqo workspace_1b1.zip
}

package() {
	cd ${srcdir}

	installpath="${pkgdir}/usr/share/vim/vimfiles"

	install -D -m644 doc/workspace.txt \
	   $installpath/doc/workspace.txt
	install -D -m644 plugin/workspace.vim \
	   $installpath/plugin/workspace.vim
}
