# Maintainer : Jimmy Stelzer <jimmy.stelzer@gmail.com>

_npmname=ionic
pkgname=nodejs-ionic-beta
pkgver=2.1.4
pkgrel=1
pkgdesc="A tool for creating and building Ionic 2 Framework mobile apps."
arch=(any)
url="http://ionicframework.com/"
license=('MIT')
depends=('nodejs' 'npm')
conflicts=('nodejs-ionic')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=('3e799d20ea079c0191ed5f0d187f565c539879db')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
