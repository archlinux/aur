# Maintainer : Jimmy Stelzer <jimmy.stelzer@gmail.com>

_npmname=ionic
_npmver=2.1.1
pkgname=nodejs-ionic-beta
pkgver=2.1.1
pkgrel=2
pkgdesc="A tool for creating and building Ionic 2 Framework mobile apps."
arch=(any)
url="http://ionicframework.com/"
license=('MIT')
depends=('nodejs' 'npm')
conflicts=('nodejs-ionic')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('7345b56915da2100a0efcd5257a4626848c4da80')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
