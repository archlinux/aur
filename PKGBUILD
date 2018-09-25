# Maintainer: Locutus <locutus@operamail.com>
# Contributor: Tobias Brunner <tobias@tobru.ch>

_npmname=cloudron
_npmver=1.5.0
pkgname=cloudron-cli # All lowercase
pkgver=1.5.0
pkgrel=1
pkgdesc="Cloudron Commandline Tool"
arch=(any)
url="https://git.cloudron.io/cloudron/cloudron-cli"
license=(MIT)
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(5d74f8769252130fde3dd00fde2aa3f9fe65cd39)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
