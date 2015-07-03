# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_npmname=express-generator
pkgname=nodejs-$_npmname
pkgver=4.12.4
pkgrel=1
pkgdesc="Express' application generator."
arch=('any')
url="http://expressjs.com"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('c45afd57c7d04d310f9f179477b06b4e32e7864f43ed8f86f1ff079c159ad419')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
