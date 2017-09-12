_npmname=wt-cli
_npmver=6.4.0
pkgname=$_npmname # All lowercase
pkgver=$_npmver
pkgrel=2
pkgdesc="Webtask Command Line Interface"
arch=(any)
url="http://github.com/auth0/wt-cli"
license=(MIT)
depends=('nodejs' 'npm' )
optdepends=()
install=wt-cli.install
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('c68719cc529fc4b61cd31e89a8c95064730ffce1')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  mv "$pkgdir/usr/bin/wt" "$pkgdir/usr/bin/webtask"
}

# vim:set ts=2 sw=2 et:
