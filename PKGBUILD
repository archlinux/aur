# Maintainer: Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=vim-openbrowser
pkgver=0.0.7
_scriptid=17003
pkgrel=1
pkgdesc="Open URI with your favorite browser from vim"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=3133"
license=('unknown')
depends=('vim')
makedepends=('unzip')
groups=('vim-plugins')
install=vimdoc.install
source=(http://www.vim.org/scripts/download_script.php?src_id=$_scriptid)
sha256sums=('c57f9e80807f6e35d33db1bcd7995816f1c998f1cd15b20cffbe427dfd61bb0e')

build() {
	cd ${srcdir}

	mv download_script.php?src_id=$_scriptid openbrowser_${pkgver}.zip
	unzip -qqo openbrowser_${pkgver}.zip
}

package() {
	cd ${srcdir}

	installpath="${pkgdir}/usr/share/vim/vimfiles"

	install -Dm644 doc/openbrowser.txt $installpath/doc/openbrowser.txt
  	install -Dm644 plugin/openbrowser.vim $installpath/plugin/openbrowser.vim
  	install -Dm644 autoload/openbrowser.vim $installpath/autoload/openbrowser.vim
  	install -Dm644 autoload/urilib.vim $installpath/autoload/urilib.vim
}
