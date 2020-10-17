# vim-limelight

# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=vim-limelight-git
_pkgname=limelight.vim
pkgver=r32.4412a84
pkgrel=1
pkgdesc='Hyperfocus-writing in Vim.'
arch=('any')
url='https://github.com/junegunn/limelight.vim'
license=('MIT')
depends=('vim')
conflicts=('vim-limelight')
provides=('vim-limelight')
source=("git+https://github.com/junegunn/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	vimfiles="$pkgdir/usr/share/vim/vimfiles"

	cd "$srcdir/$_pkgname"
	install -dv "$vimfiles"
	cp -R autoload plugin test "$vimfiles/"
}

