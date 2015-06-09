# Maintainer: Hugues Chabot <at google mail>
_npmname=eslint
_npmver=0.22.1
pkgname=nodejs-eslint # All lowercase
pkgver=0.22.1
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
sha256sums=('7d8ab9dec2e10b0c54261c9c98fef5fe66334178e7de0e9d315d18d56b98f347')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
