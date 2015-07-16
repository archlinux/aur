# Maintainer: Hugues Chabot <at google mail>
_npmname=eslint
_npmver=1.0.0-rc-1
pkgname=nodejs-eslint # All lowercase
pkgver=1.0.0_rc_1
pkgrel=1
pkgdesc="An AST-based pattern checker for JavaScript."
arch=(any)
url="http://eslint.org"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('9b8f1fbb16127106f0da8d38869a9786037c8b16b85ba92a1bed714714927f61')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
