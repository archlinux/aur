# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-ferret
pkgver=5.1
pkgrel=1
pkgdesc="Enhanced multi-file search for Vim"
arch=('any')
url="https://github.com/wincent/ferret"
license=('BSD')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
source=("$pkgname::git+$url#tag=$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('4282ED4A05CC894D53A541C3F962DC1A1941CCC4') ## Greg Hurrell

PURGE_TARGETS=('.gitignore')

package() {
	cd "$pkgname"
	find autoload doc ftplugin plugin \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
