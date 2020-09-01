# vim-codi

# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=vim-codi-git
_pkgname=codi.vim
pkgver=r288.08e26f4
pkgrel=1
pkgdesc='The interactive scratchpad for hackers.'
arch=('any')
url='https://github.com/metakirby5/codi.vim'
license=('MIT')
depends=('vim')
source=("git+https://github.com/metakirby5/$_pkgname")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	vimfiles="$pkgdir/usr/share/vim/vimfiles"

	cd "$srcdir/$_pkgname"
	install -dv "$vimfiles"
	cp -R autoload doc plugin "$vimfiles/"
}
