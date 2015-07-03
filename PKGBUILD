# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_npmname=sails
pkgname=nodejs-$_npmname
pkgver=0.11.0
pkgrel=3
pkgdesc="Realtime MVC Framework for Node.js."
arch=('any')
url="http://sailsjs.org"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('1bed1cef794f88f012a4c238435d765a8d733bf2b35e8acec8a69a5872da545b')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
