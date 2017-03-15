_npmname=git-run
_npmver=0.5.4
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
sha256sums=(d5de675e043a95459a0d2f3e7a3e4dc52d71159554d5a0d3e69c3588da9d9613)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
