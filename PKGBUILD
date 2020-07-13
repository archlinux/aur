# Contributor: Aaron Griffin <aaron@archlinux.org>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=vim-omnicppcomplete
#I know the next version will be 0.5 just to break our crap
pkgver=0.4.1
_scriptid=7722
pkgrel=10
pkgdesc="vim c++ completion omnifunc with a ctags database"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=1520"
license=('unknown')
depends=('vim' 'ctags')
groups=('vim-plugins')
source=(omnicppcomplete.zip::https://www.vim.org/scripts/download_script.php?src_id=${_scriptid})
md5sums=('0978a565f95d8980a0035133144db639')

package() {
	cd "${srcdir}"
	installpath="${pkgdir}/usr/share/vim/vimfiles"

	mkdir -p ${installpath}
	cp -r doc after autoload ${installpath}

	#just in case... make sure it's all 644
	find ${installpath} -type f -exec chmod 644 {} \;
}
