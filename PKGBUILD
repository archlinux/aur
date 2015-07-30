# Maintainer: Michael Herold <arch@michaeljherold.com>
# Contributer: Eduard Bopp <eduard dot bopp at aepsil0n dot de>

_npmname=elm
_npmver=2.0.0
pkgname=nodejs-elm # All lowercase
pkgver=2.0.0
pkgrel=1
pkgdesc="elm-platform wrapper that makes it seamlessly available as a local dependency"
arch=(any)
url="https://github.com/kevva/elm-bin"
license=()
depends=('nodejs' 'libtinfo')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(04806807bd816861d500a6de87bbaa3e0d5d5a46)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
