# Maintainer: Hugues Chabot <at google mail>
_npmname=eslint
_npmver=1.3.0
pkgname=nodejs-eslint # All lowercase
pkgver=1.3.0
pkgrel=1
pkgdesc="An AST-based pattern checker for JavaScript."
arch=(any)
url="http://eslint.org"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('cdeb8557e2cb1f8c6e0e50fd5679bf288d1db5cfe1110c53e47a189aa182a135')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
