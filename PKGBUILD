_npmname=foreman
_npmver=1.4.1
pkgname=nodejs-foreman # All lowercase
pkgver=1.4.1
pkgrel=1
pkgdesc="Node Implementation of Foreman"
arch=(any)
url="http://strongloop.github.io/node-foreman/"
license=()
depends=('nodejs' )
makedepends=('npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('58b61fb6d814c694ddf2fb75b0573606257b10e3')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
