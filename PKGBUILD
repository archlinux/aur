# Maintainer: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
_npmname=uglify-js
_npmver=2.6.2
pkgname=nodejs-uglify-js # All lowercase
pkgver=2.6.2
pkgrel=1
pkgdesc="NodeJS JS Uglifier"
arch=(any)
url="http://marijn.haverbeke.nl/uglifyjs"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('f50be88a42cd396a6251dc52ab372f71cc12fef0')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
