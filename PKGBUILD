# Maintainer: zenekron <zenekron@gmail.com>
pkgname=neovim-plug-git
pkgver=0.10.0.r38.c319036
pkgrel=1
pkgdesc="A minimalist Vim plugin manager"
arch=("any")
url="https://github.com/junegunn/vim-plug"
license=("MIT")
depends=("neovim")
makedepends=("git")
provides=("neovim-plug")
conflicts=("neovim-plug")
source=("$pkgname::git+https://github.com/junegunn/vim-plug.git")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm 644 "plug.vim" "$pkgdir/usr/share/nvim/runtime/autoload/plug.vim"
	install -Dm 644 "LICENSE"  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set tabstop=4 shiftwidth=4 colorcolumn=100 :
