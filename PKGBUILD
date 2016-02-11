# Maintainer: Chris Hobbs (RX14) <chris@rx14.co.uk>
_npmname=git-run
_npmver=0.5.1
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
sha1sums=(7d9cb28a9e8e1076d005b94baa6ec5c6316fe1e9)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
