# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>
# Contributor: Callum Parsey <callum@neoninteger.au>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Yufan You <ouuansteve at gmail>

_npmname=dockerfile-language-server-nodejs
pkgname=dockerfile-language-server
pkgver=0.15.0
pkgrel=1
pkgdesc='Language server for Dockerfiles'
arch=('any')
url='https://github.com/rcjsuen/dockerfile-language-server'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha512sums=('892dc6514027d5b0b7b0374bca0e8252721a5507d5889061f8585604f7ed2ba90992150cc451b6b2bdb93aa315699811b15b891283697e58093771426e4034d4')
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
