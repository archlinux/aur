# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Shatur95 <genaloner@gmail.com>

pkgname=vim-language-server
pkgver=2.2.4
pkgrel=1
pkgdesc="VimScript language server"
arch=('any')
url="https://github.com/iamcco/vim-language-server"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('d06531cd5ca2036eec50860e4b05ae9653ff69ea2cb283861d5a17d8c65c1ffc')
noextract=("$pkgname-$pkgver.tgz")

package() {
	npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$pkgname-$pkgver.tgz"
	find "$pkgdir/usr" -type d -exec chmod 755 '{}' \+
	chown -R root:root "$pkgdir"
}
