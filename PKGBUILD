_npmname=sinopia
_npmver=1.4.0
pkgname=nodejs-sinopia # All lowercase
pkgver=1.4.0
pkgrel=1
pkgdesc="Private npm repository server"
arch=(any)
url="https://github.com/rlidwka/sinopia"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(36bf5209356facbf6cef18fa32274d116043ed24)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
