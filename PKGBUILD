# Maintainer: marcs <aur@mg.odd.red>
# Author: Chrome Developer Relations

_npmname=yo
_npmver=3.1.1
pkgname=nodejs-yeoman # All lowercase
pkgver=3.1.1
pkgrel=1
pkgdesc="CLI tool for running Yeoman generators"
arch=(any)
url="http://yeoman.io"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('bc44b1f404360febfc0d483fec45b2a8ed08389f914b1bf059ccc4f3d268dfd5')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver

  # fix perms
  chmod 755 ${pkgbuild}/usr/bin
  find ${pkgdir}/usr/lib/node_modules/ -type d -exec chmod 755 {} +
}

# vim:set ts=2 sw=2 et:
