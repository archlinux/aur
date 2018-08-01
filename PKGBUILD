_npmname=local-npm
_npmver=2.2.2
pkgname=nodejs-local-npm
pkgver=2.2.2
pkgrel=1
pkgdesc="Local and offline-first npm mirror."
arch=(any)
url="https://github.com/local-npm/local-npm"
license=('Apache')
depends=('nodejs' )
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('181fff84ff129e7867d4d50b9d1f0f3dc4ea2990')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
