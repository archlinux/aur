# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: TJ Holowaychuk <tj at vision-media dot ca>
# Contributor: Travis Jeffery <tj at travisjeffery dot com>

_npmname=mocha
pkgname=nodejs-$_npmname
pkgver=4.0.1
pkgrel=1
pkgdesc="Simple, flexible, fun test framework."
arch=(any)
url="https://mochajs.org"
license=('MIT')
depends=('nodejs' 'npm')
options=( '!strip' )
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('9da50190aa315ddedf8db4c84bb682dafd0f10ec8c99a9f76b0372eeef4e737b')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --user root --prefix "$pkgdir/usr" $_npmname@$pkgver
}
