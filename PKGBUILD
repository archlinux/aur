_npmname=local-npm
_npmver=1.5.8
pkgname=nodejs-local-npm
pkgver=1.5.8
pkgrel=1
pkgdesc="Node server that acts as a local npm registry."
arch=(any)
url="https://github.com/nolanlawson/local-npm"
license=('Apache')
depends=('nodejs' )
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('f4fa8a9485868b45ea7c6d4c34d9dcde93fc01d0')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
