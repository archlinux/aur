# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgbase=vim-denops
pkgname=('vim-denops' 'neovim-denops')
pkgver=2.1.2
pkgrel=1
arch=('any')
url="https://github.com/vim-denops/denops.vim"
license=('MIT')
depends=('deno>=1.14.0')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('86c0e9911e857963dd2a7953eda0c8fabbd219f0639bc28fa5d4776a5b955032')

package_vim-denops() {
	pkgdesc="Vim ecosystem for writing plugins in Deno"
	groups=('vim-plugins')
	depends+=('vim>=8.2.3081')

	cd "denops.vim-$pkgver"
	find autoload denops doc plugin -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_neovim-denops() {
	pkgdesc="Neovim ecosystem for writing plugins in Deno"
	groups=('neovim-plugins')
	depends+=('neovim>=0.5.0')
	conflicts=('vim-denops')

	cd "denops.vim-$pkgver"
	find autoload denops doc plugin -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
