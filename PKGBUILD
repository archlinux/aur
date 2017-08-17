_npmname=npm-check
_npmver=5.4.5
pkgname=nodejs-npm-check
pkgver=5.4.5
pkgrel=1
pkgdesc="Check for outdated, incorrect, and unused dependencies."
arch=(any)
url="https://github.com/dylang/npm-check"
license=('MIT')
depends=('nodejs' )
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('ee2c601b7015ed892b87c923c98e000ee36736ef')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
