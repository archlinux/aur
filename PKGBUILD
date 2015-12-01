# Maintainer: Hugues Chabot <at google mail>
_npmname=eslint
_npmver=1.10.3
pkgname=nodejs-eslint # All lowercase
pkgver=1.10.3
pkgrel=1
pkgdesc="An AST-based pattern checker for JavaScript."
arch=(any)
url="http://eslint.org"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('4c2c9f02e5d35105a4b1532ea5b859065198c1dbb64a0f3273411a148a522d96')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
