# Maintainer: Marco Pompili <pompilimrc (at) gmail (dot) com>

_npmname=lumo-cljs
_npmver=1.10.1
pkgname=nodejs-lumo-cljs # All lowercase
pkgver=1.10.1
pkgrel=1
pkgdesc="Fast, cross-platform, standalone ClojureScript REPL"
arch=(any)
url="https://github.com/anmonteiro/lumo"
license=("EPL")
depends=('nodejs>=8.1.3' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('ba964b7f4280c37852738233785811a5440ad3e634d8cefe58fb085a2d2034c4')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
