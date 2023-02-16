# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Shatur95 <genaloner@gmail.com>

pkgname=vim-language-server
pkgver=2.3.0
pkgrel=1
pkgdesc="VimScript language server"
arch=('any')
url="https://github.com/iamcco/vim-language-server"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('45d6d3ddf354d281b050bb2a41faed840c0996b03705d04169787b4f91f96221')

package() {
	export NODE_ENV=production
	npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$pkgname-$pkgver.tgz"
	chown -R root:root "$pkgdir"
	## why does !emptydirs run after PURGE_TARGETS
	rm -rf "$pkgdir/usr/lib/node_modules/vim-language-server/.github/"
}
