# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: Filirom1 <filirom1@gmail.com>

_npmname=aur
_npmver=0.1.2
pkgname=nodejs-aur # All lowercase
pkgver=0.1.2
pkgrel=2
pkgdesc="Archlinux AUR cli"
arch=(any)
url="https://github.com/Filirom1/nodejs-aur"
license=(MIT)
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=("7bbe7ce1c7be3ef86e88869833466541d2901b05")

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
