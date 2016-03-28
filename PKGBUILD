# Maintainer: Hugues Chabot <at google mail>
_npmname=eslint
_npmver=2.5.3
pkgname=nodejs-eslint # All lowercase
pkgver=2.5.3
pkgrel=1
pkgdesc="An AST-based pattern checker for JavaScript."
arch=(any)
url="http://eslint.org"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('cc659e82e2c9a1ba2b40f8bb96aaf994aaa1b0a8770a546915522300158b5b21')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
