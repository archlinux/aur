# Contributor: Aaron Griffin <aaron@archlinux.org>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=vim-taglist
pkgver=46
_scriptid=19574
pkgrel=5
pkgdesc="A source code browser plugin for vim"
arch=('any')
url="http://vim-taglist.sourceforge.net/"
license=('custom')
depends=('vim' 'ctags')
makedepends=('unzip')
groups=('vim-plugins')
source=(https://www.vim.org/scripts/download_script.php?src_id=$_scriptid
        license.txt)
md5sums=('96e2ba879964b3c9e790e3906934d0c0'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
	cd ${srcdir}

	mv download_script.php?src_id=$_scriptid taglist_${pkgver}.zip
	unzip -qqo taglist_${pkgver}.zip
}

package() {
	cd ${srcdir}

	installpath="${pkgdir}/usr/share/vim/vimfiles"

	install -Dm644 doc/taglist.txt $installpath/doc/taglist.txt
  	install -Dm644 plugin/taglist.vim $installpath/plugin/taglist.vim
	install -Dm644 ${srcdir}/license.txt \
	    ${pkgdir}/usr/share/licenses/vim-taglist/license.txt
}
