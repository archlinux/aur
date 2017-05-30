# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=sails
pkgname=nodejs-$_npmname
pkgver=0.12.13
pkgrel=1
pkgdesc="Realtime MVC Framework for Node.js."
arch=('any')
url="http://sailsjs.org"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('ef7edad74fc44b5d37d9ef61227affb25724779ef132ee830d0c591ad9c73ae2')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
