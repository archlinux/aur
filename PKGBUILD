# Maintainer: Hugues Chabot <at google mail>
_npmname=eslint
_npmver=1.7.2
pkgname=nodejs-eslint # All lowercase
pkgver=1.7.2
pkgrel=1
pkgdesc="An AST-based pattern checker for JavaScript."
arch=(any)
url="http://eslint.org"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('3ee1b9036a75a6131865c71ed15afa827a82f3a2c96565be6ef3456ba75d22d4')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
