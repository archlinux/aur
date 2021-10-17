# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgbase=neovim-deoplete
pkgname=(neovim-deoplete vim-deoplete)
pkgver=6.1
pkgrel=1
pkgdesc="Dark powered asynchronous completion framework"
arch=('any')
url="https://github.com/shougo/deoplete.nvim"
license=('MIT')
depends=('python-msgpack>=1.0.0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('e355768ff81ddca974d64876d86d7a6a1a2208c062a7a28470b6583e03a9246c')

package_neovim-deoplete() {
	depends+=('neovim>=0.3.0' 'python-pynvim>=0.3.0')
	groups=('neovim-plugins')

	cd "deoplete.nvim-$pkgver"
	find autoload doc plugin rplugin -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_vim-deoplete() {
	depends+=('vim' 'python-pynvim>=0.3.0' 'nvim-yarp' 'vim-hug-neovim-rpc')
	groups=('vim-plugins')
	conflicts=('neovim-deoplete')

	cd "deoplete.nvim-$pkgver"
	find autoload doc plugin rplugin -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
