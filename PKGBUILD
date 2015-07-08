_npmname=squiffy
_npmver=4.0.0
pkgname=nodejs-squiffy # All lowercase
pkgver=4.0.0
pkgrel=1
pkgdesc="A tool for creating multiple-choice interactive stories"
arch=(any)
url="https://github.com/textadventures/squiffy#readme"
license=('MIT')
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(2d23b7e250b8b630cacaaa512d495a3bda9aabe7)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
