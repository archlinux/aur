# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=express-generator
pkgname=nodejs-$_npmname
pkgver=4.14.0
pkgrel=1
pkgdesc="Express' application generator."
arch=('any')
url="http://expressjs.com"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('71d455321d4864e1067a98b769b5133a2b82cc5992c32e7b51005dd553ed3af5')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
