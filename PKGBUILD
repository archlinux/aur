# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-asyncrun
pkgver=2.9.11
pkgrel=1
pkgdesc="Vim plugin for executing shell commands asynchronously"
arch=('any')
url="https://github.com/skywind3000/asyncrun.vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('55e3e9910a095e5c353e60d75a12801ed787d056afd55c004eeaa27cd478ab39')

package() {
	cd "asyncrun.vim-$pkgver"
	find autoload plugin lua \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm644 doc/asyncrun.txt -t "$pkgdir/usr/share/vim/vimfiles/doc/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README*.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
