# Maintainer: Hugues Chabot <at google mail>
_npmname=eslint
_npmver=1.3.1
pkgname=nodejs-eslint # All lowercase
pkgver=1.3.1
pkgrel=1
pkgdesc="An AST-based pattern checker for JavaScript."
arch=(any)
url="http://eslint.org"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('137f20fa86d9fcc79a56e44ca39294b6c4f8f226b0e97ce3e0b3ffb4c61a49fd')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
