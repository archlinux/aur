# Maintainer: Alexander Daum <alexander.daum@mailbox.org>
# Contributor: marcs <aur@mg.odd.red>
# Author: Chrome Developer Relations

_npmname=yo
_npmver=7.0.1
pkgname=nodejs-yeoman
pkgver=7.0.1
pkgrel=1
pkgdesc="CLI tool for running Yeoman generators"
arch=(any)
url="http://yeoman.io"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('466f653547a99ae4cf0de84beac13b8a882804f56718d81df3a2327343bbf7f4')

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
