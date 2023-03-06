# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-asyncrun
pkgver=2.11.16
pkgrel=1
pkgdesc="Vim plugin for executing shell commands asynchronously"
arch=('any')
url="https://github.com/skywind3000/asyncrun.vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('989a11e9def969aad6f95309233c6f59ff66aa0fc7babf90940a4dc5b30356ac')

package() {
	local dirs=(autoload plugin lua)
	cd "asyncrun.vim-$pkgver"
	find "${dirs[@]}" -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dvm644 doc/asyncrun.txt -t "$pkgdir/usr/share/vim/vimfiles/doc/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README*.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
