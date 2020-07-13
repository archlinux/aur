# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=vim-vcscommand
pkgver=1.99.47
_scriptid=19809
pkgrel=4
pkgdesc="vim version control system integration plugin"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=90"
license=('MIT')
depends=('vim>=7.0')
groups=('vim-plugins')
replaces=('vim-vsccommand') #whoops, typo before
source=(vcscommand.zip::https://www.vim.org/scripts/download_script.php?src_id=$_scriptid
        license.txt)
md5sums=('861c4e1a38664a19ce561527b9b94344'
         'cc76e422214169f380e6a1548f617778')

package() {
	cd ${srcdir}

	installpath="${pkgdir}/usr/share/vim/vimfiles"
	mkdir -p $installpath
	cp -r doc plugin syntax $installpath

	#just in case....
	find "$installpath" -type f -exec chmod 644 {} \;

	install -D -m644 license.txt \
	   ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
