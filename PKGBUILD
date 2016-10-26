# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Daniel Nagy <danielnagy at gmx dot de>
# Contributor: Remy Sharp <remy at remysharp dot com>

_npmname=nodemon
pkgname=nodejs-$_npmname
pkgver=1.11.0
pkgrel=1
pkgdesc="Simple monitor script for use during development of a node.js app."
arch=('any')
url="http://nodemon.io"
license=('MIT')
depends=('nodejs' 'npm' )
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('4db12368131fc3aac29507d80c543c4ac5126e9b9038a76841d3b29433fd6a7f')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --user root --prefix "$pkgdir/usr" $_npmname@$pkgver
}
