# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-filetype
pkgver=0.4
pkgrel=1
pkgdesc="Faster version of filetype.vim"
arch=('any')
url="https://github.com/nathom/filetype.nvim"
license=('unknown')
groups=('neovim-plugins')
depends=('neovim')
install=filetype.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('bd14e428c7fd44e8acdde6419c797f82ff86ffa318f4a0b06164831cd7ee9375')

package() {
	cd "filetype.nvim-$pkgver"
	find lua -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/pack/dist/start/$pkgname/{}" \;
	install -Dm644 filetype.vim -t "$pkgdir/usr/share/nvim/runtime/pack/dist/start/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
