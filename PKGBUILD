# Maintainer: 0x47

pkgname=vim-ycm-latex-semantic-completer-git
_gitname=vim-ycm-latex-semantic-completer
pkgver=11.352e18d
pkgver() {
	cd "$_gitname" || exit
	echo "$(git rev-list --count master).$(git rev-parse --short master)"
}
pkgrel=2
pkgdesc="A Latex Completer for YouCompleteMe"

arch=('any')
url='https://github.com/Cocophotos/vim-ycm-latex-semantic-completer'
license=('MIT')
depends=('vim-youcompleteme-git')
optdepends=('python2-bibtexparser: parsing BibTeX title and authors support')
conflicts=($_gitname)
makedepends=('git')
source=('git+https://github.com/Cocophotos/vim-ycm-latex-semantic-completer.git')
sha256sums=('SKIP')

package() {
	install_dir="$pkgdir/usr/share/vim/vimfiles/third_party/ycmd/ycmd/completers/tex"
	mkdir -p $install_dir
	cp "$srcdir/$_gitname/"{hook.py,__init__.py,latex_completer.py} $install_dir

	license_dir="$pkgdir/usr/share/licenses/$pkgname"
	mkdir -p $license_dir
	cp "$srcdir/$_gitname/LICENSE" $license_dir
}

