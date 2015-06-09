# Maintainer Daichi Shinozaki <dsdseg@gmail.com>
_npmname=nan
_npmver=1.8.4
pkgname=nodejs-nan # All lowercase
pkgver=1.8.4
pkgrel=1
pkgdesc="Native Abstractions for Node.js"
arch=(any)
url="http://github.com/rvagg/nan"
license=( "MIT" )
depends=('nodejs')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('3c76b5382eab33e44b758d2813ca9d92e9342f34')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" "$_npmname@$_npmver"
}

# vim:set ts=2 sw=2 et:
