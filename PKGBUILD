# Contributor: Aaron Griffin <aaron@archlinux.org>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=vim-project
pkgver=1.4.1
_scriptid=6273
pkgrel=10
pkgdesc="Organize and navigate projects of files (like an ide/buffer explorer)"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=69"
license=('custom')
depends=('vim')
groups=('vim-plugins')
source=("https://www.vim.org/scripts/download_script.php?src_id=$_scriptid" 'LICENSE')
md5sums=('95ddb23f0e301a79e869c608a36637de'
         '64ab6c0d41d5153d51439913d23f71ae')

build() {
	cd ${srcdir}

	mv download_script.php?src_id=$_scriptid project-${pkgver}.tar.gz
	tar xzf project-${pkgver}.tar.gz
}

package() {
	cd ${srcdir}

	installpath="${pkgdir}/usr/share/vim/vimfiles"

	install -D -m644 doc/project.txt \
	   $installpath/doc/project.txt
	install -D -m644 plugin/project.vim \
	   $installpath/plugin/project.vim
	install -D -m644 LICENSE \
	   ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
