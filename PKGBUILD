# Maintainer: Hugues Chabot <at google mail>
_npmname=eslint
_npmver=0.23.0
pkgname=nodejs-eslint # All lowercase
pkgver=0.23.0
pkgrel=1
pkgdesc="An AST-based pattern checker for JavaScript."
arch=(any)
url="http://eslint.org"
license=()
makedepends=('npm')
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('3710f5a63afd93b3660d7efa45d53b2b474361966a540cfcf9e00027e8c64851')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
