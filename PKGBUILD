# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100:

pkgname=vim-latex-support
_pkgname=latexsupport
pkgver=1.0
_src_id=19411
pkgrel=2
pkgdesc='Latex-IDE, menu support the latex programming'
arch=('any')
url='http://vim.sourceforge.net/scripts/script.php?script_id=4405'
license=('GPL2')
groups=('vim-plugins')
depends=(vim-vim-support)
optdepends=(
'texlive-latexextra: to generate DVI, PDF, PS'
'luximono: to generate DVI'
'gv: to view ps'
'texlive-bin: to view DVI, to run lacheck, to run makeindex'
'texlive-bibtexextra: to run bibtex'
'acroread: default PDF file viewer'
)
install='vimdoc.install'
options=(!strip)
source=($pkgname-$pkgver.zip::http://vim.sourceforge.net/scripts/download_script.php?src_id=$_src_id)

package() {
	cd "$srcdir"
	_vim_dir='usr/share/vim/vimfiles'

  install -dm755 "$pkgdir"/${_vim_dir}

  tar -c ./  \
    --exclude $pkgname-$pkgver.zip \
    --exclude syntax/template.vim \
    --exclude autoload \
    --exclude doc/templatesupport.txt \
    | tar -x -C "$pkgdir"/${_vim_dir}
}

md5sums=('078222233395652bb0313f20ac04329b')
