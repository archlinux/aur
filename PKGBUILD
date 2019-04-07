# Maintainer:  Liel Fridman <lielft@gmail.com>

_npmname=nearley
pkgname=nodejs-nearley
pkgver=2.16.0
pkgrel=0
pkgdesc="nearley is a simple, fast and powerful parsing toolkit."
arch=(any)
url="https://www.npmjs.com/package/nearley"
license=( "MIT" )
depends=('nodejs')
makedepends=( 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
md5sums=('7c4ab45ac94eff69b00ce2ed58c9fbfb')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
  install -Dm644 "$pkgdir/usr/lib/node_modules/$_npmname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  find "$pkgdir" -exec chmod 755 {} \;
  find "$pkgdir" -exec chown root:root {} \;

}
