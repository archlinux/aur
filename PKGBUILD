# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-dispatch
pkgver=1.8
pkgrel=1
pkgdesc="Asynchronous build and test dispatcher"
arch=('any')
url="https://github.com/tpope/vim-dispatch"
license=('custom:vim')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
source=("$pkgname::git+$url#tag=v$pkgver?signed")
md5sums=('SKIP')
validpgpkeys=('881804A5DA541152FA12C105E09E474A404A3A45')

package() {
	cd "$pkgname"
	find autoload doc plugin \
		-type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 644 README.markdown "$pkgdir/usr/share/doc/$pkgname/README.md"
}
