# Maintainer: Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=vim-openbrowser
pkgver=2.0.0
_scriptid=25873
pkgrel=2
pkgdesc="Open URI with your favorite browser from vim"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=3133"
license=('unknown')
depends=('vim')
makedepends=('unzip')
groups=('vim-plugins')
install=vimdoc.install
source=("$pkgname-$pkgver.zip::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid")
sha256sums=('2abeca5d1f5b9a5fa018893197dc2e354b54cfc837b035ba6247f2c6dc37411c')

_install_directory() {
	path=$1
	installpath=$2
	install -m755 -d $installpath/$path

	for file in $path/*; do
		if [ -f $file ]; then
			install -Dm644 -t $installpath/$path/ $file
		fi
	done
}

package() {
	cd ${srcdir}

	installpath="${pkgdir}/usr/share/vim/vimfiles"

	_install_directory doc    $installpath
	_install_directory plugin $installpath
	_install_directory lang   $installpath

	_install_directory autoload/vital/__openbrowser__/OpenBrowser $installpath
	_install_directory autoload/vital/__openbrowser__/            $installpath
	_install_directory autoload/vital/_openbrowser/Web/URI        $installpath
	_install_directory autoload/vital/_openbrowser/Web            $installpath
	_install_directory autoload/vital/_openbrowser/Vim            $installpath
	_install_directory autoload/vital/_openbrowser/Data           $installpath
	_install_directory autoload/vital/_openbrowser/               $installpath
	_install_directory autoload/vital/                            $installpath
	_install_directory autoload/                                  $installpath

}
