# Contributor: Aaron Griffin <aaron@archlinux.org>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=vim-a
pkgver=2.18
_scriptid=7218
_docid=6347
pkgrel=10
pkgdesc="alternate files in vim quickly (.c -> .h etc)"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=31"
license=('custom')
depends=(vim)
groups=('vim-plugins')
source=(https://www.vim.org/scripts/download_script.php?src_id=$_scriptid
        https://www.vim.org/scripts/download_script.php?src_id=$_docid LICENSE)
md5sums=('6570438244f71e19be1e1b84a5a6c1ec'
         '0fcef5054b1617fa8217c9bd0bede338'
         '6f4ce554c0e43d79e1532c7ba0bf63fe')

build() {
	cd ${srcdir}

	mv download_script.php?src_id=$_scriptid a.vim
	mv download_script.php?src_id=$_docid alternate.txt
}

package() {
	cd ${srcdir}

	installpath="${pkgdir}/usr/share/vim/vimfiles"

	install -D -m644 a.vim $installpath/plugin/a.vim
	install -D -m644 alternate.txt $installpath/doc/alternate.txt
	install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
