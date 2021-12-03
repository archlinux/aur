# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-headlines
pkgver=1.0.0
pkgrel=1
pkgdesc="Adds highlights for text filetypes"
arch=('any')
url="https://github.com/lukas-reineke/headlines.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c3ed090f38064ab216bb71baa9d24784a1576d01e81458d1a0bb6277e3f0d95f')

package() {
	cd "headlines.nvim-$pkgver"
	find doc lua -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
