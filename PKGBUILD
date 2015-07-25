# Maintainer: Hugues Chabot <at google mail>
_npmname=eslint
_npmver=1.0.0-rc-3
pkgname=nodejs-eslint # All lowercase
pkgver=1.0.0_rc_3
pkgrel=1
pkgdesc="An AST-based pattern checker for JavaScript."
arch=(any)
url="http://eslint.org"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('b1af17739657c8f2aac7188cbdcda5d01450e8292884d4274ede2085a1de85ce')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
