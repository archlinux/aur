# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=swagger
pkgname=nodejs-$_npmname
pkgver=0.7.5
pkgrel=1
pkgdesc="Swagger module for node.js."
arch=('any')
url="http://swagger.io"
license=('APACHE')
depends=('nodejs' 'npm' )
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('8bb2ada938e9b44137afae699feb9604013d3d2fdf7977a79d0464eaccf797e7')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --user root --prefix "$pkgdir/usr" $_npmname@$pkgver
}
