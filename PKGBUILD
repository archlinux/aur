# Maintainer: Jonne Haß <me@jhass.eu>

_npmname=ember-cli
pkgname=nodejs-$_npmname
pkgver=2.14.1
pkgrel=1
pkgdesc="The ember command line interface"
arch=('any')
url="http://www.ember-cli.com/"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('cab76ad56503c443b19814a2aa496c17c065e9fcd07d1cea52b0a2d49eee0bd9')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --no-optional --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
