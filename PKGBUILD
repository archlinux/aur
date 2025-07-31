# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>
# Contributor: Callum Parsey <callum@neoninteger.au>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Yufan You <ouuansteve at gmail>

_npmname=dockerfile-language-server-nodejs
pkgname=dockerfile-language-server
pkgver=0.14.1
pkgrel=1
pkgdesc='Language server for Dockerfiles'
arch=('any')
url='https://github.com/rcjsuen/dockerfile-language-server'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha512sums=('e746ef4569807a6c09f55243d8b210622287c8bd695b95a803543b91e278c13f9f086095c73e7d908258dc65e79e54d25c787d9e2bf759ce2916d9977e620b32')
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
