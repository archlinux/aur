# Maintainer: Locutus <locutus@operamail.com>
# Contributor: Tobias Brunner <tobias@tobru.ch>

_npmname=cloudron
_npmver=1.3.1
pkgname=cloudron-cli # All lowercase
pkgver=1.3.1
pkgrel=1
pkgdesc="Cloudron Commandline Tool"
arch=(any)
url="https://git.cloudron.io/cloudron/cloudron-cli"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(e74d842ef023a5d0d83a9308fd23b7c2db9298f6)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
