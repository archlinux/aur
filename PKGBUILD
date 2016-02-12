# Maintainer: Hugues Chabot <at google mail>
_npmname=eslint
_npmver=2.0.0
pkgname=nodejs-eslint # All lowercase
pkgver=2.0.0
pkgrel=1
pkgdesc="An AST-based pattern checker for JavaScript."
arch=(any)
url="http://eslint.org"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('5b94213bcb8d383b084bf47af6cd325fe5d3df3a9a36c096d807e2d4c607331f')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
