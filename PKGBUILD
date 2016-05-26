# Maintainer : Florent H. CARRÉ <colundrum@gmail.com>

_npmname=ionic
_npmver=1.7.15
pkgname=nodejs-ionic
pkgver=1.7.15
pkgrel=1
pkgdesc="A tool for creating and building Ionic Framework mobile apps."
arch=(any)
url="http://ionicframework.com/"
license=('MIT')
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('451900094f9012cca801f1cd6a4a4e250d89c5435c493a40977863c9d564d2d4')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
