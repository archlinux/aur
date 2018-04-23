# Maintainer: Marco Pompili <pompilimrc (at) gmail (dot) com>

_npmname=lumo-cljs
_npmver=1.8.0
pkgname=nodejs-lumo-cljs # All lowercase
pkgver=1.8.0
pkgrel=1
pkgdesc="Fast, cross-platform, standalone ClojureScript REPL"
arch=(any)
url="https://github.com/anmonteiro/lumo"
license=("EPL")
depends=('nodejs>=8.1.3' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('0b9ef5eb270dd35e8cca4be59d61c8c7d8ad71948d423b518c582dac0a173c0a')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
