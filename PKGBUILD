# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgbase=vim-melange
pkgname=(vim-melange vim-melange-extras)
pkgver=0.8.0
pkgrel=1
pkgdesc='Warm colorscheme for Vim and others'
arch=('any')
url="https://github.com/savq/melange"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0863774145df5f6004a878a52fe86969bcea102a010a9784d9818165e25f83a4')

package_vim-melange() {
	groups=('vim-plugins')
	depends=('vim-plugin-runtime')
	optdepends=('neovim-lush: extends colorscheme')

	cd "melange-$pkgver"
	find colors lua \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_vim-melange-extras() {
	pkgdesc="Extra config files using Melange colorscheme"
	cd "melange-$pkgver"
	find term \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/$pkgbase/{}" \;
}
