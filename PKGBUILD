# Maintainer: marcs <aur@mg.odd.red>
# Author: Chrome Developer Relations

_npmname=yo
_npmver=4.3.0
pkgname=nodejs-yeoman
pkgver=4.3.0
pkgrel=1
pkgdesc="CLI tool for running Yeoman generators"
arch=(any)
url="http://yeoman.io"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('02bdc1bd1cf75fd1157f161b42e1c0bc374ca14ae71059533d99038c40d6941f')

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
