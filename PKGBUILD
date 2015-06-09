# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=nodejs-pegjs
_npmname=pegjs
pkgver=0.8.0
pkgrel=1
depends=('nodejs')
pkgdesc="Parser generator for JavaScript"
arch=('any')
url="http://pegjs.org"
license=('MIT')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  #license
  install -Dm644 "$pkgdir"/usr/lib/node_modules/pegjs/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
