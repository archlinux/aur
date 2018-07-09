# Maintainer Daichi Shinozaki <dsdseg@gmail.com>
pkgname=nodejs-nan
_npmname=${pkgname#nodejs-}
pkgver=2.10.0
pkgrel=1
pkgdesc="Native Abstractions for Node.js"
arch=(any)
url="http://github.com/rvagg/nan"
license=( "MIT" )
depends=('nodejs')
makedepends=('npm')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir"/usr/lib/node_modules/

  mkdir -p "$_npmdir"
  cd "$_npmdir"

  npm install --user root -g --prefix "$pkgdir"/usr $_npmname@$pkgver
}
