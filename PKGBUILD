_npmname=webpack-dev-server
_npmver=2.4.2
pkgname=nodejs-webpack-dev-server # All lowercase
pkgver=2.4.2
pkgrel=1
pkgdesc="Serves a webpack app. Updates the browser on changes."
arch=(any)
url="http://github.com/webpack/webpack-dev-server"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha512sums=('8e8b4b333d5a1cd2ac4d87cbcaaebc67e99038a7b7641e11e8a23592851d514f2680f0da7a5b2d0fe4223f8b857d2ae3d63ef507fcb1fdee678aa0a374429b85')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
