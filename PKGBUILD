# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_npmname=express-generator
pkgname=nodejs-$_npmname
pkgver=4.13.1
pkgrel=1
pkgdesc="Express' application generator."
arch=('any')
url="http://expressjs.com"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('a0329dbe8e952426eb74bd68a97b3fffa9721fa5417ebea5301c0190c320ffb4')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
