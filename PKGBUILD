# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Yufan You <ouuansteve at gmail>

_npmname=dockerfile-language-server-nodejs
pkgname=dockerfile-language-server
pkgver=0.4.1
pkgrel=1
pkgdesc='LSP for Dockerfiles'
arch=('any')
url='https://github.com/rcjsuen/dockerfile-language-server-nodejs'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha256sums=('c0c63ba24b1f97b2242719c30fccc0b9bf82bb05a1e20464ddadb3b60dcf1746')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
	npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$_npmname-$pkgver.tgz"
	find "$pkgdir/usr" -type d -exec chmod 755 {} +
	install -Dm644 "$pkgdir/usr/lib/node_modules/$_npmname/License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	chown -R root:root "${pkgdir}"
}
