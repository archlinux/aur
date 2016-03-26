# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: Remy Sharp (http://github.com/remy)
# Contributor: remy <remy@remysharp.com>

_npmname=nodemon
_npmver=1.9.1
pkgname=nodejs-nodemon # All lowercase
pkgver=1.9.1
pkgrel=1
pkgdesc="Simple monitor script for use during development of a node.js app."
arch=(any)
url="http://nodemon.io"
license=(MIT)
depends=('nodejs' 'npm' )
optdepends=()
options=( '!strip' )
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('442071f88c39d801fb0bdfd209413da5dce6dad3')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --user root --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
