_npmname=wt-cli
_npmver=8.2.0
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
sha1sums=('3d2bc6911df95482efa417ef282ed5860a0dc8c7')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  mv "$pkgdir/usr/bin/wt" "$pkgdir/usr/bin/webtask"
}

# vim:set ts=2 sw=2 et:
