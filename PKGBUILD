# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-renamer
pkgver=5.0.0
pkgrel=1
pkgdesc="VSCode-like renaming for Neovim"
arch=('any')
url="https://github.com/filipdutescu/renamer.nvim"
license=('Apache')
groups=('neovim-plugins')
depends=('neovim' 'neovim-plenary')
install=renamer.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f73f476742dd4494b6df5f8d2769325272db95ccf4acf00e497b73fcec746a77')

package() {
	cd "renamer.nvim-$pkgver"
	find autoload doc lua plugin \
		-not \( -path "lua/tests" -prune \) \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
