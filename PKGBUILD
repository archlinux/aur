# Maintainer: Locutus <locutus@operamail.com>
# Contributor: Tobias Brunner <tobias@tobru.ch>

_npmname=cloudron
_npmver=2.0.2
pkgname=cloudron-cli # All lowercase
pkgver=2.0.2
pkgrel=1
pkgdesc="Cloudron Commandline Tool"
arch=(any)
url="https://git.cloudron.io/cloudron/cloudron-cli"
license=(MIT)
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(c97349bc60414007245d8b2bc9a54c673c81eaaf)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
