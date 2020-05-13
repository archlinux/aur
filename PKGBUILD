# Maintainer: 
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Florent H. CARRÉ <colundrum@gmail.com>

_npmname=ionic
_npmver=5.4.16
pkgname=nodejs-ionic
pkgver=5.4.16
pkgrel=1
pkgdesc="A tool for creating and building Ionic Framework mobile apps."
arch=(any)
url="http://ionicframework.com/"
license=('MIT')
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('0b184c35b2de896cfcc709d026d9362e18363c940256f8cb2b4a9803638e574d')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
