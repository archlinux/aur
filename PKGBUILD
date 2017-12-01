# Maintainer: Florian Plaza Onate <florian dot plaza at gmail dot com>
# Contributor: Laszlo Papp <djszapi at gmail dot com>
pkgname=vim-omlet
pkgver=0.13
_scriptid=4135
pkgrel=2
pkgdesc="Much better OCaml indentation, and more"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=1196"
license=('GPL2')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})
md5sums=('3f4781f25002862ad1af07008bd7fbc1')

package() {
	_vim_dir=usr/share/vim/vimfiles
	
    install -d ${pkgdir}/${_vim_dir}/{ftdetect,ftplugin,indent,syntax}

    cd ${srcdir}/omlet-${pkgver}/
	 
	for _i in ftdetect ftplugin indent syntax; do 
		install -Dm755 ${_i}/* ${pkgdir}/${_vim_dir}/${_i}/ || return 1
	done
}

