# vim-haskell

# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=vim-haskell-git
_pkgname=haskell-vim
pkgver=r449.b1ac468
pkgrel=1
pkgdesc='Syntax Highlighting and Indentation for Haskell and Cabal.'
arch=('any')
url='https://github.com/neovimhaskell/haskell-vim'
license=('BSD')
depends=('vim')
source=("git+https://github.com/neovimhaskell/$_pkgname")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	vimfiles="$pkgdir/usr/share/vim/vimfiles"
	licenses="$pkgdir/usr/share/licenses"

	cd "$srcdir/$_pkgname"
	install -dv "$vimfiles"
	cp -R after doc ftdetect indent syntax tests "$vimfiles/"
	install -Dvm644 LICENSE "$licenses/$_pkgname/LICENSE"
}

