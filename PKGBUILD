# Maintainer : Florent H. CARRÉ <colundrum@gmail.com>

_npmname=ionic
_npmver=1.7.8
pkgname=nodejs-ionic
pkgver=1.7.8
pkgrel=1
pkgdesc="A tool for creating and building Ionic Framework mobile apps."
arch=(any)
url="http://ionicframework.com/"
license=('MIT')
depends=('nodejs')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('4cb20dbd7a9e12c9dd3d9db5a25eb90f33951e6a2e0284930d3a7b93ffb9fd3a')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
