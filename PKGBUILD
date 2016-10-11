# Maintainer: Jan Koppe <post@jankoppe.de>

_npmname=yarnpkg
_npmver=0.15.1
pkgname=nodejs-yarn
pkgver=0.15.1
pkgrel=1
pkgdesc='Fast, reliable, and secure dependency management.'
arch=(any)
url='http://yarnpkg.com'
license=('BSD')
depends=('nodejs')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('fc93a937956678ba1657adb9cd65208223cd49eff3e2060e670cfc29c0337002')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}