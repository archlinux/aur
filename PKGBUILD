# Maintainer: Hugues Chabot <at google mail>
_npmname=eslint
_npmver=1.0.0-rc-2
pkgname=nodejs-eslint # All lowercase
pkgver=1.0.0_rc_2
pkgrel=1
pkgdesc="An AST-based pattern checker for JavaScript."
arch=(any)
url="http://eslint.org"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('cf4b72c1d817e47c7b0c767a246375d824bcc09c47b13baca18bb6b33e4ba339')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
