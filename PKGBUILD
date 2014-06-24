# Author: Chrome Developer Relations
# Contributor: addyosmani <addyo@google.com>
# Contributor: paulirish <paul.irish@gmail.com>
# Contributor: filirom1 <filirom1@gmail.com>
# Contributor: feydaykyn <feydaykyn@yahoo.fr>

_npmname=yo

pkgname=nodejs-yeoman
pkgver=1.2.0
pkgrel=1
pkgdesc="Command line interface for creating, building, maintaining, and shipping Yeoman projects."
arch=(any)
url="http://yeoman.io"
license=('BSD')
depends=('curl' 'git' 'ruby-compass' 'libjpeg-turbo' 'optipng' 'nodejs-bower' 'nodejs-grunt-cli')
optdepends=('phantomjs: browser-run test suite' )
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)

package() {
	npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
	rm -rf "$pkgdir"/usr/lib/node_modules/{grunt-cli,bower}
	rm -rf "$pkgdir"/usr/bin/{grunt,bower}
}

sha256sums=('2d941325cc40b21909f64107a6fd1414b6cea01f8e6eb5e6bfc0b794cf3f372d')
