# Maintainer: Lauri Niskanen <ape@ape3000.com>

pkgname=coffeelint
pkgver=1.15.0
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
md5sums=('0c551830cd2c6031f0905d101177433e')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $pkgname@$pkgver
  rmdir $pkgdir/usr/etc
}
