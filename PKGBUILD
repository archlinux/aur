# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgbase=vim-ddc
pkgname=(vim-ddc neovim-ddc)
pkgver=0.17.0
pkgrel=1
pkgdesc="Dark deno-powered completion framework"
arch=('any')
url="https://github.com/shougo/ddc.vim"
license=('MIT')
depends=('deno')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('367b8399669b0bad768383393f4f232f1a6c785aff60d9d10d517b96043d01cc')

package_vim-ddc() {
	depends+=('vim>=8.2.0662' 'vim-denops')
	groups=('vim-plugins')

	cd "ddc.vim-$pkgver"
	find autoload denops doc -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_neovim-ddc() {
	depends+=('neovim>=0.5.0' 'neovim-denops')
	conflicts=('vim-ddc')

	cd "ddc.vim-$pkgver"
	find autoload denops doc -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
