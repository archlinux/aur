# Maintainer: zenekron <zenekron@gmail.com>

pkgname=neovim-plug-git
pkgver=r608.e6a775e
pkgrel=1
pkgdesc="Minimalist Neovim Plugin Manager"
url="https://github.com/junegunn/vim-plug"
license=("MIT")
source=("$pkgname::git+https://github.com/junegunn/vim-plug")
md5sums=("SKIP")
arch=("any")
depends=("neovim")
conflicts=("neovim-plug")
provides=("neovim-plug")

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm 644 "plug.vim" \
		"$pkgdir/usr/share/nvim/runtime/autoload/plug.vim"
	install -Dm 644 "LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=4 sw=4:
