# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=neovim-lightbulb-git
pkgver=r22.388cc8c
pkgrel=2
pkgdesc="VSCode bulb for neovim's built-in LSP"
arch=('any')
url="https://github.com/kosayoda/nvim-lightbulb"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim>=0.5.0')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="$pkgname.install"
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dvm 644 lua/nvim-lightbulb.lua -t "$pkgdir/usr/share/nvim/runtime/lua/"
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
