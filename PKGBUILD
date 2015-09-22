# Maintainer: Hugues Chabot <at google mail>
_npmname=eslint
_npmver=1.5.1
pkgname=nodejs-eslint # All lowercase
pkgver=1.5.1
pkgrel=1
pkgdesc="An AST-based pattern checker for JavaScript."
arch=(any)
url="http://eslint.org"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('6691f21ef9b32d60ee5e986caadf126d47e43e87c7e7ef19bd2ae0ec7a68c5a5')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
