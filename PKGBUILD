# Maintainer:  Liel Fridman <lielft@gmail.com>

_npmname=nearley
pkgname=nodejs-nearley
pkgver=2.15.1
pkgrel=0
pkgdesc="nearley is a simple, fast and powerful parsing toolkit."
arch=(any)
url="https://www.npmjs.com/package/nearley"
license=( "MIT" )
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
md5sums=('68417ae8f248b046fc6cc8c9b188bd73')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
