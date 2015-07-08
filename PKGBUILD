_npmname=npm2arch
_npmver=0.1.19
pkgname=nodejs-npm2arch # All lowercase
pkgver=0.1.19
pkgrel=1
pkgdesc="Convert NPM package to a PKGBUILD for ArchLinux"
arch=(any)
url="https://github.com/Filirom1/npm2arch"
license=(MIT)
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(05dbc5e5ce6ae0306e22d9811df170cd26454a2d)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et: