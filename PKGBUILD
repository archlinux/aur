# Maintainer : Florent H. CARRÉ <colundrum@gmail.com>

_npmname=ionic
_npmver=1.7.14
pkgname=nodejs-ionic
pkgver=1.7.14
pkgrel=1
pkgdesc="A tool for creating and building Ionic Framework mobile apps."
arch=(any)
url="http://ionicframework.com/"
license=('MIT')
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('2ec4ac70c432f00710d6427c1259e0979a3d3490db42573af013a4c57d7fa9a7')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
