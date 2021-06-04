# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Shatur95 <genaloner@gmail.com>

pkgname=vim-language-server
pkgver=2.2.3
pkgrel=1
pkgdesc="VimScript language server"
arch=('any')
url="https://github.com/iamcco/vim-language-server"
license=('unknown')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('1915b18f06903ec4e5d0eeb98933d8ed2287f562fe4369ed9a82a8f91dd3eb68')
noextract=("$pkgname-$pkgver.tgz")

package() {
	npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$pkgname-$pkgver.tgz"
	find "$pkgdir/usr" -type d -exec chmod 755 '{}' \+
	chown -R root:root "$pkgdir"
}
