# Maintainer : Jimmy Stelzer <jimmy.stelzer@gmail.com>

_npmname=ionic
_npmver=2.0.0-beta.25
pkgname=nodejs-ionic-beta
pkgver=2.0.0.25
pkgrel=1
pkgdesc="A tool for creating and building Ionic 2 Framework mobile apps. (beta)"
arch=(any)
url="http://ionicframework.com/"
license=('MIT')
depends=('nodejs' 'npm')
conflicts=('nodejs-ionic')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('0184b9f610b8c52e72bfa287eebcdde08a1443be')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
