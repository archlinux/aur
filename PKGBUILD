# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>
# Contributor: Callum Parsey <callum@neoninteger.au>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Yufan You <ouuansteve at gmail>

_npmname=dockerfile-language-server-nodejs
pkgname=dockerfile-language-server
pkgver=0.14.0
pkgrel=1
pkgdesc='Language server for Dockerfiles'
arch=('any')
url='https://github.com/rcjsuen/dockerfile-language-server'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha512sums=('cdb1c3b9a54726b8272273a9f9b1a73043629020cd19d11a77cae8ed69dd40b19d44a8cc0ba1a7770d94293bf85959494de033c29f1c3a2bb5547901e2798682')
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
