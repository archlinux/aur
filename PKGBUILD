# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: TJ Holowaychuk <tj@vision-media.ca>
# Contributor: travisjeffery <tj@travisjeffery.com>

_npmname=mocha
_npmver=2.3.3
pkgname=nodejs-mocha # All lowercase
pkgver=$_npmver
pkgrel=1
pkgdesc="simple, flexible, fun test framework"
arch=(any)
url="http://github.com/visionmedia/mocha"
license=()
depends=('nodejs' 'npm')
optdepends=()
options=( '!strip' )
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('96488c49bfd71d86a518cb941e291a83f48d8856')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --user root --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
