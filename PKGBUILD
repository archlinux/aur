# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=neovim-due-git
pkgver=r22.212e862
pkgrel=1
pkgdesc="Neovim plugin for displaying due dates"
arch=('any')
url="https://github.com/nfrid/due.nvim"
license=('unknown')
groups=('neovim-plugins')
depends=('neovim>=0.4.4')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=due.install
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dm644 lua/due_nvim.lua -t "$pkgdir/usr/share/nvim/runtime/lua/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
