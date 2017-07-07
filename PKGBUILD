_npmname=wt-cli
_npmver=6.1.1
pkgname=$_npmname # All lowercase
pkgver=$_npmver
pkgrel=1
pkgdesc="Webtask Command Line Interface"
arch=(any)
url="http://github.com/auth0/wt-cli"
license=(MIT)
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('db95bbd0d8c27636029ce2f40e5f49b254beca88')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
