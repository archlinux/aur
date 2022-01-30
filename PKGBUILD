# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-denops
pkgver=3.0.0
pkgrel=1
pkgdesc='Vim ecosystem for writing plugins in Deno'
arch=('any')
groups=('vim-plugins')
url="https://github.com/vim-denops/denops.vim"
license=('MIT')
depends=('deno' 'vim-plugin-runtime')
replaces=('neovim-denops')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5b40663a58f8d568f3b0390500afb0643f3b1172171ed044e36a55cf19db66dc')

package() {
	cd "denops.vim-$pkgver"
	find autoload denops doc plugin \
		-type f -exec install -Dm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
