# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=neovim-lastplace-git
pkgver=r29.4d9ec88
pkgrel=1
pkgdesc="Lua rewrite of vim-lastplace"
arch=('any')
url="https://github.com/ethanholz/nvim-lastplace"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
makedepends=('git')
provides=("${pkgname%-git}" 'vim-lastplace')
conflicts=("${pkgname%-git}" 'vim-lastplace')
install="$pkgname.install"
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dvm 644 lua/nvim-lastplace/init.lua -t "$pkgdir/usr/share/nvim/runtime/lua/nvim-lastplace/"
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
