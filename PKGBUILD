_npmname=webpack-dev-server
_npmver=2.4.4
pkgname=nodejs-webpack-dev-server # All lowercase
pkgver=2.4.4
pkgrel=1
pkgdesc="Serves a webpack app. Updates the browser on changes."
arch=(any)
url="http://github.com/webpack/webpack-dev-server"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha512sums=('ee276dfba822d71a9727dfd3768bf7540aace0faf325913939c30c580efb1ee04e93553ca0ef3040e50cc04aba182d3c79f82735e62baaeff52f07f688fe0c05')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
