# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgbase=vim-melange
pkgname=(vim-melange vim-melange-extras)
pkgver=0.7.2
pkgrel=1
pkgdesc='Warm colorscheme for Vim and others'
arch=('any')
url="https://github.com/savq/melange"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('da44daba8d567ba153ab70361235ba069ccfa75fa0235091aefe6b90d8c2ef7e')

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
