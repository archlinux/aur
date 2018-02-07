# Maintainer: marcs <aur@mg.odd.red>
# Author: Chrome Developer Relations

_npmname=yo
_npmver=2.0.1
pkgname=nodejs-yeoman # All lowercase
pkgver=2.0.1
pkgrel=1
pkgdesc="CLI tool for running Yeoman generators"
arch=(any)
url="http://yeoman.io"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('99f9ce281eb3743379af6475f7e16b774ebd3b1b2af9906228f289af1d5df989')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
