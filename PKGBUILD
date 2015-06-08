# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: James Halliday <mail@substack.net> (http://substack.net)
# Contributor: substack <mail@substack.net>

_npmname=browserify
_npmver=4.1.11
pkgname=nodejs-browserify # All lowercase
pkgver=4.1.11
pkgrel=1
pkgdesc="browser-side require() the node way"
arch=(any)
url="http://github.com/substack/node-browserify"
license=( "MIT" )
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('91652e0eabb43a8a69661f566ea35e356abbf6d1')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
