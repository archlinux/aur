# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-renamer
pkgver=4.0.1
pkgrel=1
pkgdesc="VSCode-like renaming for Neovim"
arch=('any')
url="https://github.com/filipdutescu/renamer.nvim"
license=('Apache')
groups=('neovim-plugins')
depends=('neovim' 'neovim-plenary')
install=renamer.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cc258419ec0263481b43cc5e853c2ad1de372a93a7a840529c819a230c509850')

package() {
	cd "renamer.nvim-$pkgver"
	find autoload doc lua plugin \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
