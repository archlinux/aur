# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Previous Maintainer: Lauri Niskanen <ape@ape3000.com>

pkgname=coffeelint
pkgver=1.16.0
pkgrel=1
pkgdesc="Style checker for CoffeeScript"
arch=(any)
url="http://www.coffeelint.org/"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
md5sums=('6b035d5cf0de086dbe9b84e99a072205')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $pkgname@$pkgver
  rmdir $pkgdir/usr/etc
}

# vim:set ts=2 sw=2 et:
