# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-asyncrun
pkgver=2.9.15
pkgrel=1
pkgdesc="Vim plugin for executing shell commands asynchronously"
arch=('any')
url="https://github.com/skywind3000/asyncrun.vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('5f3e12cb1cf9f69e76b5877e26c2476d6e2b77d5d94e3272dc1fd7a6aa3154ac')

package() {
	cd "asyncrun.vim-$pkgver"
	find autoload plugin lua \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm644 doc/asyncrun.txt -t "$pkgdir/usr/share/vim/vimfiles/doc/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README*.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
