# vim-goyo

# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=vim-goyo-git
_pkgname=goyo.vim
pkgver=1.6.0.r37.ga865dec
pkgrel=1
pkgdesc='Distraction-free writing in Vim'
arch=('any')
url='https://github.com/junegunn/goyo.vim'
license=('unknown')
depends=('vim')
conflicts=('vim-goyo')
provides=('vim-goyo')
source=("git+https://github.com/junegunn/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long | sed 's/-/.r/;s/-/./'
}

package() {
	vimfiles="$pkgdir/usr/share/vim/vimfiles"

	cd "$srcdir/$_pkgname"
	install -dv "$vimfiles"
	cp -R autoload doc plugin "$vimfiles/"
}

