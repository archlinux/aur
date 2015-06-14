# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=vim-file-templates
pkgver=1.0
pkgrel=1
pkgdesc='File templates for VIM'
arch=('any')
url='https://sites.google.com/site/abudden/contents/Vim-Scripts/file-templates'
license=('custom:vim')
groups=('vim-plugins')
depends=('vim-runtime')
source=("${pkgname}-${pkgver}.vba::https://sites.google.com/site/abudden/contents/Vim-Scripts/file-templates/file_templates.vba?attredirects=0")
install='vimdoc.install'

build() {
	cd "$srcdir"
	_vim_dir='usr/share/vim/vimfiles'
  vim -c "set nomore" -c "UseVimball $srcdir" -c "q" $pkgname-$pkgver.vba
  install -dm755 $pkgdir/${_vim_dir}
  tar -c ./  \
    --exclude $pkgname-$pkgver.vba \
    --exclude .VimballRecord \
    | tar -x -C "$pkgdir"/${_vim_dir} 
}

md5sums=('8c49c07c77f160f30794509025132d03')
