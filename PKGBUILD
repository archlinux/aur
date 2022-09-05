# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-gitsigns
pkgver=0.5
pkgrel=1
pkgdesc="Git signs written in pure Lua"
arch=('any')
url="https://github.com/lewis6991/gitsigns.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('git' 'neovim' 'neovim-plenary')
install=gitsigns.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('781b48328d3659d521afae728eac7c389d809037ac1a2784d60fb3599158f09e')

package() {
	cd "gitsigns.nvim-$pkgver"
	find doc lua \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
