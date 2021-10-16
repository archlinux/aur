# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgbase=vim-fern
pkgname=('vim-fern' 'neovim-fern')
pkgver=1.38.4
pkgrel=1
pkgdesc="General purpose asynchronous tree viewer"
arch=('any')
url="https://github.com/lambdalisue/fern.vim"
license=('MIT')
optdepends=(
	'gomi: trash-bin functionality'
	'trash-cli: trash-bin functionality')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4eef77d6fb2984a64760c77751ac266104c39c277a678ffb2395622f19bf8275')

package_vim-fern() {
	depends=('vim>=8.1')
	groups=('vim-plugins')

	cd "fern.vim-$pkgver"
	find autoload doc ftplugin plugin \
		-type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_neovim-fern() {
	depends=('neovim>=0.4.4' 'neovim-fixcursorhold')
	groups=('neovim-plugins')

	cd "fern.vim-$pkgver"
	find autoload doc ftplugin plugin \
		-type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
