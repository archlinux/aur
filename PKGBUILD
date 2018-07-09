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
#source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
#noextract=($_npmname-$pkgverver.tgz)
#sha1sums=('fb3c59d45fe4effe215f0b890f8adf6eb32d2232')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir"/usr/lib/node_modules/

  mkdir -p "$_npmdir"
  cd "$_npmdir"

  npm install --user root -g --prefix "$pkgdir"/usr $_npmname@$pkgver
}
