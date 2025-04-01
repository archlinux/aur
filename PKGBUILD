# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>
# Contributor: Callum Parsey <callum@neoninteger.au>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Yufan You <ouuansteve at gmail>

_npmname=dockerfile-language-server-nodejs
pkgname=dockerfile-language-server
pkgver=0.13.0
pkgrel=1
pkgdesc='Language server for Dockerfiles'
arch=('any')
url='https://github.com/rcjsuen/dockerfile-language-server'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha512sums=('afc1b04065411ee463f379c562803bba519fa7ab60507f20c653d16a9d1ec2eae811bfd780fe0ab4bb0850837d0af9136607bf2245fb71b15354ed25abd819dc')
noextract=("$pkgname-$pkgver.tgz")

package() {
	export NODE_ENV=production
	npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$pkgname-$pkgver.tgz"
	install -d \
		"$pkgdir/usr/share/licenses/$pkgname/" \
		"$pkgdir/usr/share/doc/$pkgname/"
	ln -s \
		"/usr/lib/node_modules/$_npmname/License.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	ln -s \
		"/usr/lib/node_modules/$_npmname/OriginalLicense.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/ORIGINAL_LICENSE"
	ln -s \
		"/usr/lib/node_modules/$_npmname/README.md" \
		"$pkgdir/usr/share/doc/$pkgname/"
}
