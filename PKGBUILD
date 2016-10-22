# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_npmname=express-generator
pkgname=nodejs-$_npmname
pkgver=4.13.4
pkgrel=1
pkgdesc="Express' application generator."
arch=('any')
url="http://expressjs.com"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('68b21d309a305c4d301aebabaf4f4117548ed4895289824f95acccf64206c4ba')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
