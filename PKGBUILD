# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-fixcursorhold-git
pkgver=r10.f2572b0
pkgrel=1
pkgdesc="Fixes CursorHold performance in Neovim"
arch=('any')
url="https://github.com/antoinemadec/fixcursorhold.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
makedepends=('git')
provides=("${pkgname%-git}" 'neovim-fix-cursorhold')
conflicts=("${pkgname%-git}")
replaces=('neovim-fix-cursorhold')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dm 644 plugin/fix_cursorhold_nvim.vim -t "$pkgdir/usr/share/nvim/runtime/plugin/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
