# Maintainer: Jan Koppe <post@jankoppe.de>

_npmname=yarnpkg
_npmver=0.15.1
pkgname=yarn
pkgver=0.15.1
pkgrel=2
pkgdesc='Fast, reliable, and secure dependency management.'
arch=(any)
url='http://yarnpkg.com'
license=('BSD')
depends=('npm' 'python')
source=('LICENSE')
sha256sums=('3992e4db1e3af655b0413667c9e7089757154d46a36a94659f35fc090fdcf15a')

package() {
  mkdir -p "$pkgdir/usr/share/licenses/yarn"
  cp "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/yarn/LICENSE"
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
