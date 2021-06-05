# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=neovim-web-devicons-git
pkgver=r60.da717e1
pkgrel=1
pkgdesc="A Lua fork of vim-devicons for Neovim"
arch=('any')
url="https://github.com/kyazdani42/nvim-web-devicons"
license=('unknown')
groups=('neovim-plugins')
depends=('neovim' 'nerd-fonts')
makedepends=('git')
provides=("${pkgname%-git}" 'vim-devicons')
conflicts=("${pkgname%-git}" 'vim-devicons')
install="$pkgname.install"
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dvm 644 lua/nvim-web-devicons.lua -t "$pkgdir/usr/share/nvim/runtime/lua/"
	install -Dvm 644 plugin/nvim-web-devicons.vim -t "$pkgdir/usr/share/nvim/runtime/plugin/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
