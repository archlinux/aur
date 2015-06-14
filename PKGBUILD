# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Karl Kochs <captainhaggy @ i2pmail dot org>
# Contributor: Laszlo Papp <djszapi @ gmail at com>

pkgname=vim-c
provides=(vim-c-support)
pkgver=6.1.1
_scriptid=21803
pkgrel=2
pkgdesc="C/C++ IDE --  Write and run programs. Insert statements, idioms, comments etc."
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=213'
license=('GPL2')
depends=('vim-vim-support>=2.3')
groups=('vim-plugins')
install='vimdoc.install'
source=($pkgname-$pkgver.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})
package() {
	cd "$srcdir"
	_vim_dir='usr/share/vim/vimfiles'

  install -d ${pkgdir}/${_vim_dir}

  tar -c ./  \
    --exclude $pkgname-$pkgver.zip \
    --exclude autoload/mmtemplates/core.vim \
    --exclude doc/templatesupport.txt \
    --exclude syntax/template.vim \
    | tar -x -C ${pkgdir}/${_vim_dir}
}
sha256sums=('431a24b4548ed74314f517daca18e687a6b6ed39ef40a5df2fee77e2468bd663')
