# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Filirom1 <filirom1@gmail.com>

_npmname=npm2aur
pkgname=nodejs-npm2aur # All lowercase
pkgver=0.1.3
pkgrel=2
pkgdesc="Sync AUR with NPM packages"
arch=(any)
url="http://github.com/Filirom1/npm2aur"
license=(MIT)
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=( 'e2e3deb3d34593045d59acd71552d110a66ad303' )

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}

# vim:set ts=2 sw=2 et:
