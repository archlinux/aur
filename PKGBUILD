# Author: Chrome Developer Relations
# Contributor: addyosmani <addyo@google.com>
# Contributor: paulirish <paul.irish@gmail.com>
# Contributor: filirom1 <filirom1@gmail.com>
# Contributor: feydaykyn <feydaykyn@yahoo.fr>

_npmname=yo

pkgname=nodejs-yeoman
pkgver=1.8.3
pkgrel=1
pkgdesc="Command line interface for creating, building, maintaining, and shipping Yeoman projects."
arch=(any)
url="http://yeoman.io"
license=('BSD')
depends=('npm' 'curl' 'git' 'ruby-compass' 'libjpeg-turbo' 'optipng' 'bower' 'nodejs-grunt-cli')
optdepends=('phantomjs: browser-run test suite' )
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('232d3a35c7d803021d40ee5d83bed47d894e459f95be4d00624c0408291b94f7')

package() {
	npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"

	rm -rf "$pkgdir"/usr/lib/node_modules/{grunt-cli,bower}
	rm -rf "$pkgdir"/usr/bin/{grunt,bower}
	rm -rf "$pkgdir"/usr/etc

	chmod -R go-w "$pkgdir"/usr
}
