# Maintainer Daichi Shinozaki <dsdseg@gmail.com>
_npmname=nan
_npmver=2.3.2
pkgname=nodejs-nan # All lowercase
pkgver=2.3.2
pkgrel=1
pkgdesc="Native Abstractions for Node.js"
arch=(any)
url="http://github.com/rvagg/nan"
license=( "MIT" )
depends=('nodejs')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('4d4ecf17e1da4e989efb4f273d8d00201cad087e')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" "$_npmname@$_npmver"
}

# vim:set ts=2 sw=2 et:
