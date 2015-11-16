# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_npmname=sails
pkgname=nodejs-$_npmname
pkgver=0.11.2
pkgrel=1
pkgdesc="Realtime MVC Framework for Node.js."
arch=('any')
url="http://sailsjs.org"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('30c23940170e99e8599369b11c658ff5044787a8630454d96929545d3d00c9f1')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
