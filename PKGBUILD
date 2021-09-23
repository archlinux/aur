# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Shatur95 <genaloner@gmail.com>

pkgname=vim-language-server
pkgver=2.2.5
pkgrel=1
pkgdesc="VimScript language server"
arch=('any')
url="https://github.com/iamcco/vim-language-server"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('40144aa5eb6ab0d9e2e6c3438f5d68a37ee26ce1a77666ef49c84fef1fa22c62')
noextract=("$pkgname-$pkgver.tgz")

package() {
	export NODE_ENV=production
	npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$pkgname-$pkgver.tgz"
	chown -R root:root "$pkgdir"
}
