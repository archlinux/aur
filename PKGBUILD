# Maintainer: csicar <aur@csicar.de>
_npmname=spago
_npmver=0.9.0
pkgname=nodejs-spago # All lowercase
pkgver=0.9.0
pkgrel=1
pkgdesc="PureScript package manager and build tool powered by Dhall and package-sets"
arch=(any)
url="https://github.com/spacchetti/spago"
license=('BSD3')
depends=('nodejs' 'npm' 'purescript')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(9d7002c3f5b66f7f95182a5de9e642f385d1e995)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
