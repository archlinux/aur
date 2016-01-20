# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=postcss-cli
pkgname=nodejs-$_npmname
pkgver=2.4.0
pkgrel=1
pkgdesc="Traditional CLI for postcss."
arch=('any')
url="https://github.com/code42day/postcss-cli"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('4c612d31da8697ccf8d18a8294bd33f89cf969587630d0d4a339377cd5561e7f')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
