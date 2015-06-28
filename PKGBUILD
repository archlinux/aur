# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Matthew Eernisse <mde@fleegix.org> (http://fleegix.org)
# Contributor: mde <mde@fleegix.org>

_npmname=jake
_npmver=8.0.12
pkgname=nodejs-jake
pkgver=$_npmver
pkgrel=1
pkgdesc="JavaScript build tool, similar to Make or Rake"
arch=(any)
url="http://github.com/mde/jake"
license=()
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('24aae8741604b463347cf1792ed3ce2991c76d7a981aa7e0e8ccfa118b89bec0')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
