# Maintainer: Hugues Chabot <at google mail>
_npmname=eslint
_npmver=0.24.0
pkgname=nodejs-eslint # All lowercase
pkgver=0.24.0
pkgrel=1
pkgdesc="An AST-based pattern checker for JavaScript."
arch=(any)
url="http://eslint.org"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('bdb2ce0f0cb5277c53b69091a8c0728f107debdfed8dcfe8b3a1af51f7b17789')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
