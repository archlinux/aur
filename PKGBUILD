# Maintainer: Chris Hobbs (RX14) <chris@rx14.co.uk>
_npmname=git-run
_npmver=0.4.0
pkgname=nodejs-$_npmname # All lowercase
pkgver=$_npmver
pkgrel=1
pkgdesc="A tool for managing multiple git repositories"
arch=(any)
url="https://github.com/mixu/gr"
license=('BSD')
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(48b1ca14b9e0dcf7d861740e169b3221b3957d99)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
