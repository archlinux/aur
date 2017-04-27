# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=express-generator
pkgname=nodejs-$_npmname
pkgver=4.15.0
pkgrel=1
pkgdesc="Express' application generator."
arch=('any')
url="http://expressjs.com"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('b573e6fadbbf29f8aeaaf6ede7398377acde27bc050b03af38e3753311e830c7')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
