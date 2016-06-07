# Author: Chrome Developer Relations
# Contributor: addyosmani <addyo@google.com>
# Contributor: paulirish <paul.irish@gmail.com>
# Contributor: filirom1 <filirom1@gmail.com>
# Contributor: feydaykyn <feydaykyn@yahoo.fr>

_npmname=yo

pkgname=nodejs-yeoman
pkgver=1.8.4
pkgrel=1
pkgdesc="Command line interface for creating, building, maintaining, and shipping Yeoman projects."
arch=(any)
url="http://yeoman.io"
license=('BSD')
depends=('npm' 'curl' 'git' 'ruby-compass' 'libjpeg-turbo' 'optipng' 'bower' 'nodejs-grunt-cli')
optdepends=('phantomjs: browser-run test suite' )
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('4f096859019b36d4a4c5e078816da29962c5123e6147b4747b65581a974d08a5')

package() {
	npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"

	rm -rf "$pkgdir"/usr/lib/node_modules/{grunt-cli,bower}
	rm -rf "$pkgdir"/usr/bin/{grunt,bower}
	rm -rf "$pkgdir"/usr/etc

	chmod -R go-w "$pkgdir"/usr
}
