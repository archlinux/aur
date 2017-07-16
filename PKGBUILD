_npmname=webpack-dev-server
_npmver=2.5.1
pkgname=nodejs-webpack-dev-server # All lowercase
pkgver=2.5.1
pkgrel=1
pkgdesc="Serves a webpack app. Updates the browser on changes."
arch=(any)
url="http://github.com/webpack/webpack-dev-server"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha512sums=('2c7ef775f6b40cc6ac941d36e18757f31a537f68c0166dd065f0f580b97deb9d9ef466f9ee5b144fbe3ecc7c896bc091da9a5cf747b358007ef9d4e54eaefc24')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
