_npmname=webpack-dev-server
_npmver=1.15.1
pkgname=nodejs-webpack-dev-server # All lowercase
pkgver=1.15.1
pkgrel=1
pkgdesc="Serves a webpack app. Updates the browser on changes."
arch=(any)
url="http://github.com/webpack/webpack-dev-server"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha512sums=('1b763566c9a02ac0c8be1c008a2d4ad948ad8ea9508c2511e4897e85443a96dc8db701668996db86a5a317a45e3fca0422c88fed938a45cfff105640fb5ba0e2')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
