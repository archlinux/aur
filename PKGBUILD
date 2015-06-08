# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Remy Sharp (http://github.com/remy)
# Contributor: remy <remy@remysharp.com>

_npmname=nodemon
_npmver=1.3.7
pkgname=nodejs-nodemon # All lowercase
pkgver=1.3.7
pkgrel=1
pkgdesc="Simple monitor script for use during development of a node.js app."
arch=(any)
url="http://nodemon.io"
license=(MIT)
depends=('nodejs' )
optdepends=()
options=( '!strip' )
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('447bc2e01bf499cbf5853f9937496e0a04835449')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --user root --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
