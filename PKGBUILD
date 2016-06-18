# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=swagger-tools
pkgname=nodejs-$_npmname
pkgver=0.10.1
pkgrel=1
pkgdesc="A Node.js and browser module that provides tooling around Swagger."
arch=('any')
url="https://github.com/apigee-127/swagger-tools"
license=('MIT')
depends=('nodejs' 'npm' )
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('67de70db3c6ff45c30acdf67e9bba3f29ba78b0d05c2387f811680f02c69f7d3')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --user root --prefix "$pkgdir/usr" $_npmname@$pkgver
}
