_npmname=webpack-dev-server
_npmver=2.5.0
pkgname=nodejs-webpack-dev-server # All lowercase
pkgver=2.5.0
pkgrel=1
pkgdesc="Serves a webpack app. Updates the browser on changes."
arch=(any)
url="http://github.com/webpack/webpack-dev-server"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha512sums=('9b9be116f1b5bca974758ddcc6037716247a6d3b187e381ae70e9491042efeb421e1a15b3059d71e97d1f6426776e62ee5e9ef3ec46ffa5499fdf1627db18df7')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
