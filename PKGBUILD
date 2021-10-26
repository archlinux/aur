# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgbase=vim-melange
pkgname=(vim-melange vim-melange-extras)
pkgver=0.7.1
pkgrel=1
pkgdesc='Warm colorscheme for Vim and others'
arch=('any')
url="https://github.com/savq/melange"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3b938b11c60a01d1122fae4f3251de5c86a054258eb9a92a01ebe83208588df7')

package_vim-melange() {
	groups=('vim-plugins')
	depends=('vim-plugin-runtime')
	optdepends=('neovim-lush: extends colorscheme')

	cd "melange-$pkgver"
	find colors lua -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_vim-melange-extras() {
	pkgdesc="Extra config files using Melange colorscheme"
	cd "melange-$pkgver"
	find term -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/$pkgbase/{}" \;
}
