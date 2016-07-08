_npmname=electron-rebuild
_npmver=1.1.5
pkgname=nodejs-electron-rebuild # All lowercase
pkgver=1.1.5
pkgrel=1
pkgdesc="Electron supporting package to rebuild native node modules against the currently installed electron"
arch=(any)
url="https://github.com/paulcbetts/electron-rebuild"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(2db95e9a6a52685c8c1cb9acfd05aaa23f7352f2)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
