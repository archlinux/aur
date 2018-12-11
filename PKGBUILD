_npmname=foreman
_npmver=3.0.1
pkgname=nodejs-foreman # All lowercase
pkgver=3.0.0
pkgrel=1
pkgdesc="Node Implementation of Foreman"
arch=(any)
url="http://strongloop.github.io/node-foreman/"
license=()
depends=('nodejs' )
makedepends=('npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('805f28afc5a4bbaf08dbb1f5018c557dcbb8a410')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
