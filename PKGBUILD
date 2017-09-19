_npmname=webpack-dev-server
_npmver=2.8.0
pkgname=nodejs-webpack-dev-server # All lowercase
pkgver=2.8.0
pkgrel=1
pkgdesc="Serves a webpack app. Updates the browser on changes."
arch=(any)
url="http://github.com/webpack/webpack-dev-server"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha512sums=('b881e9496a9e01c6bffe70e30020079210431b6c09837843fec2022262e3e117ac66c736b7e59a050d1fe052f9d2377cf4d2da663be52d12aeedac8c39374e86')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
